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
 @RequestMapping("/csQBrowse")
	public ModelAndView csQBrowse() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csQBrowse");
		return mav;
	}	
 @RequestMapping("/csAnswerA")
	public ModelAndView csAnswerA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csAnswerA");
		return mav;
	}	
 @RequestMapping("/csFAQWrite")
	public ModelAndView csFAQWrite() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csFAQWrite");
		return mav;
	}	
 @RequestMapping("/csQOpen")
	public ModelAndView csQOpen() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csQOpen");
		return mav;
	}	
	//신고 목록 보기
	@RequestMapping("/csreportListA")
	public ModelAndView csreportListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csreportListA");
		return mav;
	} 
	//신고 채팅 보기
	@RequestMapping("/csChat")
	public ModelAndView csChat() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/csChat");
		return mav;
	} 
	
	
	
	
	
	
  
}