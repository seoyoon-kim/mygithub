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
		
		//테이블이 product/들어가는 수: productnum int/나오는 값 1개
		//sellfinish,thumbimg,productname,productprice,selloption,sellweight,
		//deliveryoption,origin,wrapping
		mav.addObject("plist",productViewService.ProductViewSelect(productnum));
		mav.addObject("plist",productViewService.ProductViewSelectFarm(productnum));
		mav.addObject("plist",productViewService.ProductViewSelectoption(productnum));
		
		mav.setViewName("custom/customproduct");
		
		return mav;
	}
	
}
