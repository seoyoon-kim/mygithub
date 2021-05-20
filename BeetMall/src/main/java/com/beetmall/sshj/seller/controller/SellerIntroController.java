package com.beetmall.sshj.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerIntroFarmService;
import com.beetmall.sshj.seller.vo.SellerIntroFarmVO;

@Controller
public class SellerIntroController {
	@Autowired
	SellerIntroFarmService service;
	
	@RequestMapping("/sellerIntroFarm")
	public ModelAndView intro_farm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("logId")!=null) {
			String userid = (String)session.getAttribute("logId");
			SellerIntroFarmVO vo = service.selectInfo(userid);
			if((int)session.getAttribute("logType") == 2 ) {
				mav.addObject("result", service.selectInfo(userid)); // 전체 데이터 불러오기
				mav.addObject("result1",service.discountSelect(userid)); // 디스카운트 확인
				mav.addObject("favorite", service.selectFavorite(userid)); // 즐겨찾기 수 불러오기
				mav.setViewName("seller/sellerIntroFarm");
			}	else {
				mav.setViewName("redirect:/");
				
			}
		} else {
			mav.setViewName("redirect:/");
			
		}
		return mav;
	}
	
}
