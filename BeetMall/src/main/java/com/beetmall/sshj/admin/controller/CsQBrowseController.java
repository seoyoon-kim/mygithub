package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.CsQBrowseService;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Controller
public class CsQBrowseController {
	
	@Inject
	CsQBrowseService csQBrowseService;
	
	@RequestMapping("/csQBrowse")
	public ModelAndView csQBrowse(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(csQBrowseService.csQBrowseOnetotalRecord(pageVO));
		
		mav.addObject("list", csQBrowseService.csQBrowseList(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/csQBrowse");
		return mav;
	}	
	
	@RequestMapping("/csQOpen")
	public ModelAndView csQOpen(int qnum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", csQBrowseService.csQOpenSelect(qnum));
		mav.setViewName("/admin/csQOpen");
		return mav;
	}	 
}
