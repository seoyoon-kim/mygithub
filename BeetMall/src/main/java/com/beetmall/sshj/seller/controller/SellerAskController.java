package com.beetmall.sshj.seller.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

			mav.addObject("askList",service.reviewlist(vo));
			mav.addObject("resultData",vo);
			
			mav.setViewName("seller/sellerAskManagement");
			return mav;
		} else {
			mav.setViewName("seller/sellerAskManagement");
			return mav;
		}
	}
}
