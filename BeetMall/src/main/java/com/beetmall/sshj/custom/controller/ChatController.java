package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping("chatdel")
	@ResponseBody
	public int chatDel(HttpServletRequest req, HttpSession session) {
		int result = 0;
		String userid = (String)session.getAttribute("logId");
		String usertype = "";
		int roomcode = 0;
		if(req.getParameter("roomcode")!=null) {
			roomcode = Integer.parseInt(req.getParameter("roomcode"));
		}
		
		System.out.println("userid="+userid);
		System.out.println("usertype="+usertype);
		System.out.println("roomcode="+roomcode);
		if(chatservice.outRoomSelect(userid, roomcode)>0) { 	// creator
			usertype="cre_out";
		}else {												// receiver
			usertype="rec_out";
		}
		if(chatservice.chatRoomOut(roomcode, usertype)>0) {
			result = 1;
		}else {
			result = -1;
		}
		chatservice.roomClean();
		
		return result;
	}
}
