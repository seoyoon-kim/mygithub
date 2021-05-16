package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.ChatServiceImp;
import com.beetmall.sshj.custom.vo.PointPageVO;

@Controller
public class ChatController {
	@Inject
	ChatServiceImp chatservice;
	
	@RequestMapping("myChatList")
	public ModelAndView myChatList(HttpSession session, HttpServletRequest req) {	// 채팅내역
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		String pageNumStr = req.getParameter("pageNum");
		PointPageVO pageVO = new PointPageVO();
		pageVO.setUserid(userid);
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		pageVO.setTotalRecord(chatservice.getRecord(userid));
		
		mav.addObject("list", chatservice.selectChat(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("mypages/myChatList");
		return mav;
	}
}
