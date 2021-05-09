package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.ProductViewServiceImp;

@Controller
public class ProductViewController {

	
	@Inject ProductViewServiceImp productViewService;
	
	
	////////////////productView///////////////////
	
	@RequestMapping("/ProductViewSelect")
	public ModelAndView ProductViewSelect(int productnum) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("plist", productViewService.ProductViewSelect(productnum));
		mav.setViewName("custom/customproduct");
		
		return mav;
	}
	
}
