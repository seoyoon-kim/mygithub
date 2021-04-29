package com.beetmall.sshj.custom.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	/*
	@RequestMapping(value="/recipeWriteOk", method=RequestMethod.POST)
	   public ModelAndView RecipeWriteOk(RecipeVO vo, HttpServletRequest req, HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		
		
		  String path=req.getSession().getServletContext().getRealPath("/upload");
		  System.out.println(path);
		  String paramName = recipemainimg.getName();//매게 변수
		  String orgName = recipemainimg.getOriginalFilename();
		  System.out.println(paramName+"-->"+orgName);
		 		

	     //transferTo(): 실제 업로드 발생
		  
		  try {
			  if(orgName!=null && !orgName.equals("")) {
				  recipemainimg.transferTo(new File(path,orgName));//업로드
			  }
		  }catch(Exception e) {
			  e.printStackTrace();
			  
		  }
		  
		  ////데이터 다시 받아오기////////////////////////
		  RecipeVO vo=new RecipeVO();
		  vo.setUserid(userid);
		  vo.setRecipetitle(recipetitle);
		  vo.setRecipecontent(recipecontent);
		  vo.setRecipemainimg(orgName);
          
	
	
		int result = RecipeService.RecipeInsert(vo);
					
					  if(result<=0) {
							  if(recipemainimg!=null) {
								  File f=new File(path, recipemainimg);
								  f.delete();				  
							  }			 
							  mav.setViewName("redirect:recipeView");			  
					 }else {
							  mav.setViewName("redirect:recipeWriteOk");
						        }
					  return mav;
		           }
	  
		
	
	*/
	
}
