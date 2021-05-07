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
	//공지 목록 보기
	@RequestMapping("/noticeBoardList")
	public ModelAndView noticeBoardList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/noticeBoardList");
		return mav;
	}
	//공지 목록 작성하기
	@RequestMapping("/noticeBoardWrite")
	public String noticeBoardWrite() { 
		 return "/admin/noticeBoardWrite"; 
	}
	//상품 목록 보기
	@RequestMapping("/productListA")
	public ModelAndView productListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/productListA");
		return mav;
	}
	//상품 상세 보기
	@RequestMapping("/productDetailA")
	public ModelAndView productDetailA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/productDetailA");
		return mav;
	}
	//리뷰 목록보기
	@RequestMapping("/reviewListA")
	public ModelAndView reviewListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/reviewListA");
		return mav;
	}
	//레시피 목록 보기
	@RequestMapping("/recipeListA")
	public ModelAndView recipeListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/recipeListA");
		return mav;
	}
	//레시피 작성하기
	@RequestMapping("/recipeWriteA")
	public ModelAndView recipeWriteA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/recipeWriteA");
		return mav;
	}
	//신고 목록 보기
	@RequestMapping("/reportListA")
	public ModelAndView reportListA() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", adminService.noticeList());
		mav.setViewName("/admin/reportListA");
		return mav;
	} 
	
	
	
	
	
	
	
	
}
	
	
	
  
	
	 