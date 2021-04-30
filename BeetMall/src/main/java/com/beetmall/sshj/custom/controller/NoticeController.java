package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.NoticeService;

@Controller
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("/kcenter")
	public ModelAndView kcenter() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", noticeService.noticeAllRecord());
		mav.setViewName("custom/customerCenter/noticeMain");
		
		return mav;
	}
	
	@RequestMapping("/notice_view2")
	public ModelAndView notice_view2(int infonum) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", noticeService.noticeSelect(infonum));
		mav.setViewName("custom/customerCenter/notice_view");
		
		return mav;
	}
}
