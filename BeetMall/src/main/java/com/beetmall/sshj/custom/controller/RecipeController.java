package com.beetmall.sshj.custom.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.RecipeServiceImp;
import com.beetmall.sshj.custom.vo.RecipeVO;

	@Controller
	public class RecipeController {

	@Inject
	RecipeServiceImp RecipeService;

	@RequestMapping("/recipeView")
	public ModelAndView RecipeSelect(int recipenum) {
		//////////2해당 게시글 보이게 하기
		ModelAndView mav=new ModelAndView();
	
		mav.addObject("vo", RecipeService.RecipeSelect(recipenum));
		mav.setViewName("custom/recipeView");
		
		return mav;
	}
	
	
	
	@RequestMapping("/recipeList")
	public ModelAndView RecipeAllList() {
		
		ModelAndView mav=new ModelAndView();
		//////////1게시글 목록 뽑아내기
		mav.addObject("list" , RecipeService.RecipeAllList());			
		mav.setViewName("custom/recipeList");
		
		return mav;
	}

	
	@RequestMapping("/recipeWrite")
	public String RecipeWrite() {
		return "custom/recipeWrite";
	}
	
	@RequestMapping(value="/recipeWriteOk", method=RequestMethod.POST)
	public ModelAndView recipeWriteOk(RecipeVO vo, @RequestParam MultipartFile file, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		
//     	String userid = (String)req.getSession().getAttribute("logId");
		//파일업로드
		//저장 위치
		String path = req.getSession().getServletContext().getRealPath("/upload");
		System.out.println("path --> " + path);
		
 //   	String paramName = recipemainimg.getName(); //매개변수 이름확인할라고 SYSOUT찎을라고만든거
		String orgName = file.getOriginalFilename();//원파일명
		
   
		//실제 업로드 발생 : tansferTo()
		try {
			if(orgName != null && !orgName.equals("")) {
				file.transferTo(new File(path, orgName));//파일업로드
				vo.setRecipemainimg(orgName);
			}
		}catch (Exception e) {
			System.out.println("파일업로드 에러발생 --> " + e.getMessage());
		}
		
		int result = RecipeService.recipeWriteOk(vo);
		////////////////////////////////////////
		//레코드 추가 실패시 파일을 삭제
		if(result<=0) {
			//첫번쨰 파일삭제
			if(orgName != null) {
				File f = new File(path, orgName);
				f.delete();
			}
			mav.setViewName("redirect:recipeWrite"); //세팅이안됫을때
		}else {
			
			mav.setViewName("redirect:recipeList"); //됬을때
		}
		
		
		
		mav.setViewName("redirect:recipeList");
		
		return mav;
	}
	
	@RequestMapping("/recipeHome")
	public ModelAndView RecipeAllListHome() {
		
		ModelAndView mav=new ModelAndView();
		//////////1게시글 목록 뽑아내기
		mav.addObject("list" , RecipeService.RecipeAllListHome());

		mav.setViewName("custom/recipeHome");
		
		return mav;
	}
	
	
	@RequestMapping("/customMyrecipe")
	public ModelAndView customMyrecipe(String userid) {
		
		ModelAndView mav=new ModelAndView();
		//////////1게시글 목록 뽑아내기
		mav.addObject("list" , RecipeService.customMyrecipe());	
		mav.setViewName("custom/customMyrecipe");
		
		return mav;
	}

	
	
	/////////////////////////////////////레시피 추천 수 올리기///////////////////////////////////////
	
	@RequestMapping("/recigoodOk")
	@ResponseBody
	public int recigoodOk(HttpServletRequest req) {
//	ModelAndView mav=new ModelAndView();
	int data= Integer.parseInt(req.getParameter("num"));

	System.out.println(RecipeService.recigoodOk(data));
	
//	mav.addObject("goodvo", RecipeService.recigoodOk(data));
//	mav.setViewName("custom/recipeView");
	
	return data;
}
	
	///////////////////////////////////// 레시피 추천 기록///////////////////////////////////////
	
	@RequestMapping("/recigoodOk2")
	@ResponseBody
	public String recigoodOk2(HttpServletRequest req) {
		String id=req.getParameter("id");
		int num=Integer.parseInt(req.getParameter("num"));
		System.out.println(RecipeService.recigoodOk2(id, num));
	return num+","+id;
}
	
	///////////////////////////////////레시피 장바구니 등록////////////////////////////////////////////
	
	@RequestMapping("/recikeepOk")
	@ResponseBody
	public String recikeepOk(HttpServletRequest req) {
		String id=req.getParameter("id");
		int num=Integer.parseInt(req.getParameter("num"));
		System.out.println(RecipeService.recikeepOk(id, num));
	return num+","+id;
}
 
	////////////////////////////////////장바구니 담은 레시피 선택/////////////////////////////////
	
	@RequestMapping("/customMyrecipe2")
	@ResponseBody
	public ModelAndView customMyrecipe2(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		
		String id=req.getParameter("id");
	
		mav.addObject("list2" , RecipeService.customMyrecipe2(id));	
		
		
		mav.setViewName("custom/customMyrecipe");
		
		return mav;
		
	
	}

	


	
}
