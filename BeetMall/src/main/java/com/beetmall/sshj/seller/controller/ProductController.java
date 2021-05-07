package com.beetmall.sshj.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.ProductService;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;


@Controller
public class ProductController {
	
	@Autowired
	com.beetmall.sshj.seller.service.FarmService farmService;
	@Autowired
	ProductService productService;
	
	//검색
	//판매상품 목록
	  @RequestMapping("/product_list") 
	  public ModelAndView product_list(ProductVO vo, SearchAndPageVO spvo, HttpSession session) { 
		  
		  ModelAndView mav = new ModelAndView();
		  vo.setUserid((String)session.getAttribute("logId"));
		  mav.addObject("productList", productService.productAllSelect(vo.getUserid()));
			
		  if(spvo.getSearchWord()!=null) { //%% like 연산자
				//spvo.setSearchWord("%"+spvo.getSearchWord()+"%");
				spvo.setSearchWord(spvo.getSearchWord());
			
			System.out.println("word=" + spvo.getSearchWord());
		  }
		  mav.addObject("productList", productService.searchList(spvo)); 
		  mav.setViewName("seller/product_list"); 
		  return mav; 
	  }
	
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
		vo.setUserid((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		
		if(productService.productInsert(vo)>0) {
			mav.setViewName("redirect:product_list");
		}else {
			mav.setViewName("redirect:product_regi");
		}
		return mav;
	}
	//여러개 레코드 한번에 삭제 
	
	
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
