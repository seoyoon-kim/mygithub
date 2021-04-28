package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.dao.MemberDAO;
import com.beetmall.sshj.custom.service.MemberService;
import com.beetmall.sshj.custom.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService memberservice;
	
	@RequestMapping("register")	// 회원가입페이지
	public String register() {
		return "login/register";
	}
	@RequestMapping("cregister")
	public String cResigter() {	// 구매자 회원가입
		return "login/cRegister";
	}
	@RequestMapping("sregister")
	public String sRegister() {	// 판매자 회원가입
		return "login/sRegister";	
	}
	
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	// 아이디 중복검사
	@RequestMapping("/idCheck")
	public ModelAndView idOverlapCheck(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = req.getParameter("useridCheck");
		if(userid!=null && userid.equals("")) {
			System.out.println("userid-->"+userid);
			if(memberservice.idOverlap(userid)==0) {
				mav.addObject("overlap","Y");
			}else {
				mav.addObject("overlap","N");
			}
			mav.addObject("userid",userid);
			mav.setViewName("redirect:register");
		}
		return mav;
	}
	
	
	@RequestMapping(value="loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*
		 * if(memberservice.loginOk(userid, userpwd)==1) { session.setAttribute("logId",
		 * userid); session.setAttribute("logName"); }
		 */
		
		return mav;
	}
	
	// 회원가입
	@RequestMapping(value="/cregiFinish", method=RequestMethod.POST)
	public ModelAndView regiFinishiOk(MemberVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String tel1 = req.getParameter("userphone1");
		String tel2 = req.getParameter("userphone2");
		String tel3 = req.getParameter("userphone3");
		vo.setUserphone(tel1+"-"+tel2+"-"+tel3);
		
		// 확인용 //
		System.out.println("id-->"+vo.getUserid());
		System.out.println("pwd-->"+vo.getUserpwd());
		System.out.println("name-->"+vo.getUsername());
		System.out.println("tel-->"+vo.getUserphone());
		System.out.println("email-->"+vo.getUseremail());
		System.out.println("zipcode-->"+vo.getUserzipcode());
		System.out.println("addr-->"+vo.getUseraddr());
		System.out.println("userdetaildder-->"+vo.getUserdetailaddr());
		System.out.println("birth-->"+vo.getBirthday());
		System.out.println("joindate-->"+vo.getJoindate());
		System.out.println("type-->"+vo.getUsertype());
		System.out.println("stop-->"+vo.getUserstop());
		System.out.println("point-->"+vo.getPoint());
		// 확인용 //				
		
		if(memberservice.regiFinishiOk(vo)==1) {
			mav.setViewName("redirect:/");
		}else {
			mav.addObject(vo);
			mav.addObject("userphone1",tel1);
			mav.addObject("userphone2",tel2);
			mav.addObject("userphone3",tel3);
			mav.addObject("result","NO");
			mav.setViewName("redirect:cregister");
		}
		return mav;
	}
	
	@RequestMapping("regiFinish")
	public String regiFinish() {	// 회원가입 완료
		return "login/registerFinish";	
	}
}
