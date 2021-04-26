package com.beetmall.sshj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.service.FarmService;

@Controller
public class FarmController {
	@Autowired
	FarmService service;
	
	@RequestMapping("/seller_sales")
	public ModelAndView seller_sales() {
		ModelAndView mav = new ModelAndView();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",service.allCategoryList());		
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
	@RequestMapping("/notice")
	public String notice() {
		return "seller/notice";
	}
	@RequestMapping("/notice_view")
	public String noticeView() {
		return "seller/notice_view";
	}
	@RequestMapping("/ask_admin_list")
	public String ask_admin_list() {
		return "seller/ask_admin_list";
	}
	@RequestMapping("/ask_admin_view")
	public String ask_admin_view() {
		return "seller/ask_admin_view";
	}
	@RequestMapping("/ask_admin_write")
	public String ask_admin_write() {
		return "seller/ask_admin_write";
	}
	@RequestMapping("/ask_admin_edit")
	public String ask_admin_edit() {
		return "seller/ask_admin_edit";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "seller/faq";
	}
	
}
