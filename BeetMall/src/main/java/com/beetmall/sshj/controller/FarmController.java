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
	
	@RequestMapping("/seller_sales") // seller_sales 페이지
	public ModelAndView seller_sales() {
		ModelAndView mav = new ModelAndView();
		// 카테고리 리스트를 불러와서 리스트에 담는다
		// 대분류, 중분류 카테고리가 모두 들어있다.
		mav.addObject("cateList",service.allCategoryList());		
		mav.setViewName("seller/seller_sales");
		return mav;
	}
	
	@RequestMapping("/seller_review") // seller_review 페이지
	public String seller_review() {
		return "seller/seller_review";
	}
	
	@RequestMapping("/intro_farm") // intro_farm 페이지
	public String intro_review() {
		return "seller/intro_farm";
	}
	
	@RequestMapping("/edit_farm") // edit_farm 페이지
	public String edit_farm() {
		return "seller/edit_farm";
	}
	
	@RequestMapping("/getListData") // seller_sales 페이지에서 차트와 엑셀 데이터 가져오는 dao
	public String getListData() {
		// 제한사항
		// 날짜의 데이터가 넘어오지 않을경우 DB 조회를 하지 않는다
		
		return "seller/seller_sales";
	}
}
