package com.beetmall.sshj.admin.controller;

import javax.inject.Inject; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Boardervice;
 

@Controller
public class admin_productController { 
	@Inject
	Boardervice adminService;
	//////////////////////상품 관리///////////////////////////////////// 

	//상품 목록 보기
	@RequestMapping("/productListA")
	public ModelAndView productListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/productListA");
		return mav;
	}
	//상품 상세 보기
	@RequestMapping("/productEditA")
	public ModelAndView productEditA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/productEditA");
		return mav;
	} 
	
	
	
	
	
	
	
}
	
	
	
  
	
	 