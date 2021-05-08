package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerFaqService;
@Controller
public class SellerFaqController {
	@Autowired
	SellerFaqService sellerfaqService;
	
	@RequestMapping("/faq")
	public ModelAndView faqList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqList", sellerfaqService.sellerfaqAllRecord());
		mav.setViewName("seller/faq");
		return mav;
	}
}
