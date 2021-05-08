package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerFaqService;
@Controller
public class SellerFaqController {
	@Inject
	SellerFaqService sellerfaqService;
	
	@RequestMapping("/faq")
	public ModelAndView sellerfaqAllRecord() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqList", sellerfaqService.sellerfaqAllRecord());
		mav.setViewName("seller/faq");
		return mav;
	}
}
