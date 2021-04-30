package com.beetmall.sshj.admin.controller;

import javax.inject.Inject; 
 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Boardervice; 

@Controller
public class admin_csController {

	@Inject
	Boardervice adminService;
	 
	/////////////////////////고객센터//////////////////////
 @RequestMapping("/csQuestionA")
	public ModelAndView csQuestionA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csQuestionA");
		return mav;
	}
 @RequestMapping("/csQuestionBrowse")
	public ModelAndView csQuestionBrowse() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csQuestionBrowse");
		return mav;
	}
 @RequestMapping("/csFAQ")
	public ModelAndView csFAQ() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csFAQ");
		return mav;
	}
	
	
	
	
  
}