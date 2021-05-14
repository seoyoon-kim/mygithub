package com.beetmall.sshj.seller.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerAskManagementService;
import com.beetmall.sshj.seller.service.SellerSalesService;
import com.beetmall.sshj.seller.vo.SellerAskManagementVO;
import com.beetmall.sshj.seller.vo.SellerReviewVO;

@Controller
public class SellerAskController {
	
	@Autowired
	SellerSalesService FarmService;
	
	@Autowired
	SellerAskManagementService service;
	
	@RequestMapping("/sellerAskManagement")
	public ModelAndView sellerAskManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SellerAskManagementVO vo = new SellerAskManagementVO();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",FarmService.allCategoryList());		
		
		// 문의 내역을 가져온다
		String userid = (String)session.getAttribute("logId");
		
		// 로그인 풀릴때가 있다 확인용
		if(userid != null) {
			
			List<SellerAskManagementVO> list = service.breakdown(userid);
			
			// 가져온 데이터가 0이면 바로 return 시킨다.
			if(list.size()==0) {
				mav.setViewName("seller/sellerAskManagement");
				return mav;
			}
			
			/////////////////////////////////////////////////////////////
			
			
			// 오늘날짜 구하기
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date day = new Date();
			String today= format.format(day);
			
			int nullResult = 0;
			int newResult = 0;
			for(int i = 0; i< list.size(); i++) {
				SellerAskManagementVO dataCheck = list.get(i);
				
				// 미답변 갯수
				if(dataCheck.getQanswer() != null ) {}
				else {nullResult += 1;}
				
				// 새리뷰 갯수
				if(today.equals(dataCheck.getQwritedate())) {
					newResult += 1;
				}
			}
			
			int initialArr[] = {0};
			// 전체 리뷰 갯수
			vo.setTotalAsk(list.size());
			vo.setNullAsk(nullResult);
			vo.setNewAsk(newResult);
			vo.setStartDate("");
			vo.setSearchTxt("");
			vo.setMcatenumDataArr(initialArr);
			vo.setSortStr(0);
			
			// 위에서는 total record를 구하기 위해서이고, 밑에서는 리스트를 불러오기 위해서 
			// vo에 userid와 totalrecord를 넣어 조건으로 검색해준다.
			vo.setUserid(userid);
			vo.setTotalRecord(list.size());

			mav.addObject("askList",service.asklist(vo));
			mav.addObject("resultData",vo);
			
			mav.setViewName("seller/sellerAskManagement");
			return mav;
		} else {
			mav.setViewName("seller/sellerAskManagement");
			return mav;
		}
	}
	
	// 문의내역 페이징,, + 모든 데이터 조합하기
	@RequestMapping(value = "/SellerAskPaging", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Object> SellerAskPaging(HttpServletRequest req, HttpSession session, SellerAskManagementVO vo ){
		vo.setUserid((String)session.getAttribute("logId"));
		
		List<SellerAskManagementVO> total = service.asklistRecord(vo);
		
		// 총 record 갯수를 구한 값을 vo에 넣어준다.
		vo.setTotalRecord(total.size());
		ArrayList<Object> dataList = new ArrayList<Object>();
		dataList.add(0, service.asklist(vo));
		dataList.add(1, vo);
		
		return dataList;
	}
	
	// 문의 답변 등록
	@RequestMapping(value = "/SellerAskAnswer",method = RequestMethod.POST)
	@ResponseBody
	public void answerUpdate(SellerAskManagementVO vo) {
		int result = service.askUpdate(vo);
		
		if(result == 1) {
			System.out.println("문의 등록 성공");
		} else {
			System.out.println("문의 답변 등록 실패");
		}
		
	}
	
	// 문의 신고 접수
	@RequestMapping(value = "/SellerAskReport",method = RequestMethod.POST)
	@ResponseBody
	public void declarationUpdate(HttpSession session, SellerAskManagementVO vo) {
		// sellerId를 저장한다.
		vo.setSellerId((String)session.getAttribute("logId"));
		
		//문의 테이블에 신고 여부 넣기 1
		int result = service.reportInsert(vo);
		
		if(result == 1) {
			System.out.println("문의 등록 성공");
		} else {
			System.out.println("문의 답변 등록 실패");
		}
		
	}
}
