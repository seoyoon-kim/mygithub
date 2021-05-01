package com.beetmall.sshj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.service.FarmService;

@Controller
public class ProductController {
	
	//대분류, 중분류 카테고리 데이터를 가져오기 위해 이미 만들어진 FarmService 의존객체 자동주입
	@Autowired
	FarmService farmService;
	
	//판매상품 목록
	@RequestMapping("/product_list")
	public String product_list() {
		return "seller/product_list";
	}
	//판매 상품등록페이지 대분류,중분류 카테고리 불러오기
	@RequestMapping("/product_regi")
	public ModelAndView category_select() {
	ModelAndView mav = new ModelAndView();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",farmService.allCategoryList());		
		mav.setViewName("seller/product_regi");
		return mav;
	}
	//판매상품등록
	/*
	 * @RequestMapping("/product_regi") public String product_regi() { return
	 * "seller/product_regi"; }
	 */
	//판매자 주문관리
	@RequestMapping("/order_management")
	public String order_management() {
		return "seller/order_management";
	}
	//판매자 판매관리
	@RequestMapping("/sale_management")
	public String seller_management() {
		return "seller/sale_management";
	}
}
