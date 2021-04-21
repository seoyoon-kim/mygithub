package com.bitcamp.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.myapp.service.MemberService;
import com.bitcamp.myapp.vo.MemberVO;
@Controller
public class MemberController {
	@Inject
	MemberService memberService;
	
	//로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}

	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//logVo가 null이면 로그인 실패, not null이면 VO에 아이디, 이름을 저장하여 리턴받는다 
		MemberVO logVo = memberService.loginCheck(vo);
		
		if(logVo!=null) {//로그인 성공
			session.setAttribute("logVo", logVo);
			mav.setViewName("redirect:/");
		}else {//로그인 실패
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
}
