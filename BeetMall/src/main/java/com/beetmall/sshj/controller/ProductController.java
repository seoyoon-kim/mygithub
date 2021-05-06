package com.beetmall.sshj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.service.FarmService;
import com.beetmall.sshj.service.ProductService;
import com.beetmall.sshj.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	FarmService farmService;
	@Autowired
	ProductService productService;
	
	//판매상품 목록
	@RequestMapping("/product_list")
	public ModelAndView product_list() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productList", productService.productAllSelect());
		mav.addObject("discountList", productService.discountSelect());
		mav.addObject("optionList", productService.optionSelect());
		mav.setViewName("seller/product_list");
		return mav;
	}
	//즐겨찾기 수 계산
	//판매상품 삭제 시 진행중인 주문있으면 불가능
	
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
	@RequestMapping(value="/product_regi_ok", method=RequestMethod.POST)
	public ModelAndView product_regi(ProductVO vo, HttpSession session, HttpServletRequest req) {
		
		//session
		vo.setUserid((String)session.getAttribute("logVo"));
		
		ModelAndView mav = new ModelAndView();
		
		if(productService.productInsert(vo)>0) {
			mav.setViewName("redirect:product_list");
		}else {
			mav.setViewName("redirect:product_regi");
		}
		return mav;
	}
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
