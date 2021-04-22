package com.beetmall.sshj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FarmController {
	@RequestMapping("/seller_sales")
	public ModelAndView seller_sales() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("seller/seller_sales");
		return mav;
	}
	
	@RequestMapping("/seller_review")
	public String seller_review() {
		return "seller/seller_review";
	}
	
	@RequestMapping("/intro_farm")
	public String intro_review() {
		return "seller/intro_farm";
	}
	
	@RequestMapping("/edit_farm")
	public String edit_farm() {
		return "seller/edit_farm";
	}
}
