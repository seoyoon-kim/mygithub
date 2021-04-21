package com.bitcamp.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest; 

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.servlet.ModelAndView;
 
import com.bitcamp.myapp.service.BoardService;
import com.bitcamp.myapp.vo.BoardVO; 

@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	@RequestMapping("/list")
	public ModelAndView boardList(String searchKey, String searchWord) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.allList(searchKey, searchWord ));
		if(searchKey!=null && searchWord!=null) {
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchWord", searchWord);
		}
		mav.setViewName("board/list");
		return mav; 
	}
	
	
	 
	 
	
	@RequestMapping("/view")
	public String boardView(int no, Model model) {
		model.addAttribute("vo", service.boardSelect(no));
		return "/board/view";
	}

	@RequestMapping("/write")
	public String boardWrite() { 
		return "board/write";
	}
	
	@RequestMapping(value="/writeOk", method=RequestMethod.POST)
	public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest req) {
		vo.setUserid((String)req.getSession().getAttribute("logId")); 
		vo.setIp(req.getRemoteAddr());
		ModelAndView mav = new ModelAndView(); 
		if(service.boardInsert(vo)>0) {
			mav.setViewName("redirect:list");
		}else {
			mav.setViewName("redirect:write");
		}
		return mav;
	}
		

}
