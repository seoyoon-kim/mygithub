package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.NoticeService;
import com.beetmall.sshj.custom.vo.PageSearchVO;

@Controller
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("/kcenter")
	public ModelAndView kcenter(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(noticeService.noticeOnetotalRecord(pageVO));
		
		mav.addObject("list", noticeService.noticeAllRecord(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("custom/customerCenter/noticeMain");
		
		return mav;
	}
	
	@RequestMapping("/notice_view2")
	public ModelAndView notice_view2(int infonum) {
		ModelAndView mav = new ModelAndView();
		
		//조회수증가
		noticeService.noticeHit(infonum);
		
		mav.addObject("vo", noticeService.noticeSelect(infonum));
		mav.setViewName("custom/customerCenter/notice_view");
		
		return mav;
	}
}
