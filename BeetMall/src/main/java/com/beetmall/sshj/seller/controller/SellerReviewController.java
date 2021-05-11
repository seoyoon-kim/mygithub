package com.beetmall.sshj.seller.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.FarmService;
import com.beetmall.sshj.seller.service.SettleReviewService;
import com.beetmall.sshj.seller.vo.SettleReviewVO;

@Controller
public class SellerReviewController {
	
	@Autowired
	FarmService FarmService;
	
	@Autowired
	SettleReviewService service;
	
	@RequestMapping("/seller_review")
	public ModelAndView seller_review(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SettleReviewVO vo = new SettleReviewVO();
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",FarmService.allCategoryList());		
		
		// 리뷰 내역을 가져온다
		String userid = (String)session.getAttribute("logId");
		// 로그인 풀릴때가 있다 확인용
		if(userid != null) {
			
			List<SettleReviewVO> list = service.breakdown(userid);
			
			// 가져온 데이터가 0이면 바로 return 시킨다.
			if(list.size()==0) {
				mav.setViewName("seller/seller_review");
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
				SettleReviewVO dataCheck = list.get(i);
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
			
			
			// 전체 리뷰 갯수
			vo.setTotalReview(list.size());
			vo.setNullReview(nullResult);
			vo.setNewReview(newResult);
			if(totalScore == 0) {
				vo.setTotalScore(totalScore);
			} else {
				vo.setTotalScore(Double.parseDouble(String.format("%.2f", (double)totalScore/list.size() )));
			}
			
			
			mav.addObject("reviewList",list);
			mav.addObject("resultData",vo);
			
			mav.setViewName("seller/seller_review");
			return mav;
		} else {
			mav.setViewName("home");
			return mav;
		}
		
	}
}
