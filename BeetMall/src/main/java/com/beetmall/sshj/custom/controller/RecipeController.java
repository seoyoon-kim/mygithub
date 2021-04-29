package com.beetmall.sshj.custom.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.dao.RecipeDAO;
import com.beetmall.sshj.custom.service.RecipeServiceImp;
import com.beetmall.sshj.custom.vo.RecipeVO;

	@Controller
	public class RecipeController {

	@Inject
	RecipeServiceImp RecipeService;

	@RequestMapping("/recipeView")
	public ModelAndView RecipeAllList() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("list" , RecipeService.RecipeAllList());
		mav.setViewName("custom/recipeView");
		return mav;
	}

	
	/////////////////////////////
	
	@RequestMapping("/recipeWrite")
	public String RecipeWrite() {
		return "custom/recipeWrite";
	}
	
	
    /////////////////////////////
	
	
	
	
}
