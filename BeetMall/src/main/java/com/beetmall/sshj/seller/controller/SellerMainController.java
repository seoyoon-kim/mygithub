package com.beetmall.sshj.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerMainService;

@Controller
public class SellerMainController {
	
	@Autowired
	SellerMainService serview;
	
	@RequestMapping("/sellerMain")
	public ModelAndView sellerMainPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		session.getAttribute("logId");
		
		mav.setViewName("seller/sellerMainPage");
		
		return mav;
	}
}
