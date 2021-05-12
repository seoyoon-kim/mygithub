package com.beetmall.sshj.seller.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		Enumeration e = req.getParameterNames();
		while(e.hasMoreElements()) {
			String name = (String)e.nextElement();
			String[] values = req.getParameterValues(name);
			for(String value : values) {
				System.out.println("name = " + name + ", value = " + value);
			}
		}
		List<SellerReviewVO> total = service.reviewlistRecord(vo);
		System.out.println(vo.getUserid());
		System.out.println(vo.getStartDate()=="");
		System.out.println(vo.getEndDate()=="");
		System.out.println(vo.getSearchTxt()=="");
		System.out.println(vo.getMcatenumDataArr()[0]==0);
		System.out.println(total.size());
		vo.setTotalRecord(total.size());
		ArrayList<Object> dataList = new ArrayList<Object>();
		dataList.add(0, service.reviewlist(vo));
		dataList.add(1, vo);
		return dataList;
	}


}
