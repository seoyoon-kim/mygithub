package com.beetmall.sshj.seller.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerSalesService;
import com.beetmall.sshj.seller.service.SellerReviewService;
import com.beetmall.sshj.seller.vo.SellerReviewVO;

@Controller
public class SellerReviewController {
	
	@Autowired
	SellerSalesService FarmService;
	
	@Autowired
	SellerReviewService service;
	// 트랜잭션//
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	//////////
	
	@RequestMapping("/sellerReview")
	public ModelAndView seller_review(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SellerReviewVO vo = new SellerReviewVO();
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",FarmService.allCategoryList());		
		
		// 리뷰 내역을 가져온다
		String userid = (String)session.getAttribute("logId");
		// 로그인 풀릴때가 있다 확인용
		if(userid != null) {
			
			List<SellerReviewVO> list = service.breakdown(userid);
			
			// 가져온 데이터가 0이면 바로 return 시킨다.
			if(list.size()==0) {
				mav.setViewName("seller/sellerReview");
				return mav;
			}
			
			/////////////////////////////////////////////////////////////
			
			
			// 오늘날짜 구하기
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date day = new Date();
			String today= format.format(day);
			
			int nullResult = 0;
			int newResult = 0;
			int totalScore = 0;
			for(int i = 0; i< list.size(); i++) {
				SellerReviewVO dataCheck = list.get(i);
				// 미답변 갯수
				if(dataCheck.getReviewanswer() != null ) {}
				else {nullResult += 1;}
				
				// 새리뷰 갯수
				if(today.equals(dataCheck.getReviewwritedate())) {
					newResult += 1;
				}
				
				// 사용자 총 평점
				totalScore += dataCheck.getReviewscore();
			}
			
			int initialArr[] = {0};
			// 전체 리뷰 갯수
			vo.setTotalReview(list.size());
			vo.setNullReview(nullResult);
			vo.setNewReview(newResult);
			vo.setStartDate("");
			vo.setSearchTxt("");
			vo.setMcatenumDataArr(initialArr);
			vo.setSortStr(0);
			
			if(totalScore == 0) {
				vo.setTotalScore(totalScore);
			} else {
				vo.setTotalScore(Double.parseDouble(String.format("%.2f", (double)totalScore/list.size() )));
			}
			
			vo.setUserid(userid);
			vo.setTotalRecord(list.size());

			mav.addObject("reviewList",service.reviewlist(vo));
			mav.addObject("resultData",vo);
			
			mav.setViewName("seller/sellerReview");
			return mav;
		} else {
			mav.setViewName("home");
			return mav;
		}
	}
	
	//@RequestMapping(value = "/SellerReviewPaging",method = RequestMethod.GET)
	@RequestMapping(value = "/SellerReviewPaging",method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Object> reviewPaging(HttpServletRequest req, HttpSession session, SellerReviewVO vo, Model model) {
		vo.setUserid((String)session.getAttribute("logId"));
		
//		넘어온 파라미터 키와 밸류 값을 확인
//		Enumeration e = req.getParameterNames();
//		while(e.hasMoreElements()) {
//			String name = (String)e.nextElement();
//			String[] values = req.getParameterValues(name);
//			for(String value : values) {
//				System.out.println("name = " + name + ", value = " + value);
//			}
//		}
		
		List<SellerReviewVO> total = service.reviewlistRecord(vo);
		
		// 총 record 갯수를 구한 값을 vo에 넣어준다.
		vo.setTotalRecord(total.size());
		ArrayList<Object> dataList = new ArrayList<Object>();
		dataList.add(0, service.reviewlist(vo));
		dataList.add(1, vo);
		
		return dataList;
	}
	
	@RequestMapping(value = "/SellerReviewAnswer",method = RequestMethod.POST)
	@ResponseBody
	public void answerUpdate(SellerReviewVO vo) {
		int result = service.answerUpdate(vo);
		
		if(result == 1) {
			System.out.println("리뷰 등록 성공");
		} else {
			System.out.println("리뷰 답변 등록 실패");
		}
		
	}
	
	@RequestMapping(value = "/SellerReviewReport",method = RequestMethod.POST)
	@ResponseBody
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public void declarationUpdate(HttpSession session, SellerReviewVO vo) {
		// sellerId를 저장한다.
		vo.setSellerId((String)session.getAttribute("logId"));
		
		System.out.println(vo.getUserid());
		System.out.println(vo.getReportReason());
		System.out.println(vo.getReportContent());
		System.out.println(vo.getSellerId());
		System.out.println(vo.getReviewnum());
		//트랜잭션 구현을 위한 객체생성
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션 호출
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			//리뷰 테이블에 신고 여부 넣기 1
			int result1 = service.reviewReportUpdate(vo);
			int result2 = service.reportInsert(vo);
			System.out.println(result1);
			System.out.println(result2);
			transactionManager.commit(status);
			System.out.println("등록 성공");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			transactionManager.rollback(status);
		}
		
	}

}
