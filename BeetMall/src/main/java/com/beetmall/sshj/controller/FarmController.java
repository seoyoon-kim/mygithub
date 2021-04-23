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
		// 대분류, 중분류 카테고리가 모두 들어있다.
		mav.addObject("cateList",service.allCategoryList());		
		
		//계산은 언제 발동하는가?
		// 중분류 카테고리가 눌렸을 때,
		// 중분류 카테고리 삭제할 때
		// 날짜 적용 눌렀을 때
		
		// 계산은 어떻게 해야하나?
		// 월 단위인지, 년 단위인지, 일 단위인지에 따라서 계산되는 값이 달라져야 한다
		// 미쳤다.
		
		
		
		
		
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
