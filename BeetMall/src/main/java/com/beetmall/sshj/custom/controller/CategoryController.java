package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CategoryService;

@Controller
public class CategoryController {
	@Inject
	CategoryService categoryService;
	
	@RequestMapping("/mapping")
	public ModelAndView mapping() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", categoryService.mapAllRecord());
		mav.setViewName("custom/category/mapList");
		
		return mav;
	}
	
	@RequestMapping("/kangsan")
	public String kangsan() {
		return "custom/category/categoryMain";
	}
	
	@RequestMapping("/kangsan2")
	public String kangsan2() {
		return "custom/category/uglyItem";
	}
	
	@RequestMapping("kangsan3")
	public String kangsan3() {
		return "custom/category/categoryCharge";
	}
	
	@RequestMapping("kangsan4")
	public String kangsan4() {
		return "custom/category/payCategory";
	}
	
	
}
