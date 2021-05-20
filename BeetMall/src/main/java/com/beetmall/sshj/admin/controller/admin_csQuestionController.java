package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.CsQuestionService;

@Controller
public class admin_csQuestionController {
	
	@Inject
	CsQuestionService csquestionService;
	
//	@RequestMapping("/csQuestionA")
//	public ModelAndView csQuestionA() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/admin/csQuestionA");
//		return mav;
//	}
	
	@RequestMapping("/cscsQuestionA")
	public String csQuestionA() {
		return "/admin/csQuestionA";
	}
}
