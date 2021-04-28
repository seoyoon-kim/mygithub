package com.beetmall.sshj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
