package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.BoardVO; 

@Controller
public class admin_Home { 
	@Inject
	Boardervice adminService;
	//////////////////////관리자 홈페이지///////////////////////////////////// 
	@RequestMapping("/adminHome")
	public ModelAndView noticeBoardList() {
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/admin/adminHome");
		return mav;
	}
	
}