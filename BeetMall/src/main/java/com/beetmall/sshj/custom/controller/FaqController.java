package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.FaqService;

@Controller
public class FaqController {
	@Inject
	FaqService faqService;
	
	@RequestMapping("FAQBoard")
	public ModelAndView FAQBoard() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", faqService.faqAllRecord());
		mav.setViewName("custom/customerCenter/FAQBoard");
		
		return mav;
	}
}
