package com.beetmall.sshj.admin.controller;

import javax.inject.Inject; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Boardervice;
 

@Controller
public class admin_boardController { 
	@Inject
	Boardervice adminService;
	//////////////////////공지 관리///////////////////////////////////// 
	@RequestMapping("/noticeBoardList")
	public ModelAndView noticeBoardList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/noticeBoardList");
		return mav;
	}
	
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() { 
		 return "/admin/noticeBoardWrite"; 
	}
	
	@RequestMapping("/productListA")
	public ModelAndView productListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/productListA");
		return mav;
	}
	
	@RequestMapping("/reviewListA")
	public ModelAndView reviewListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/reviewListA");
		return mav;
	}
	
	@RequestMapping("/recipeListA")
	public ModelAndView recipeListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/recipeListA");
		return mav;
	}
	
	@RequestMapping("/reportListA")
	public ModelAndView reportListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/reportListA");
		return mav;
	}
}
	
	
	
  
	
	 