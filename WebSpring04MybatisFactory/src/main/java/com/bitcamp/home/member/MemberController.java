package com.bitcamp.home.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	public SqlSession sqlSession;
		
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) {
		//추상클래스와 xml파일을 매핑한다
		MemberDAOImpl dao = sqlSession.getMapper(MemberDAOImpl.class);
		MemberVO logVO = dao.loginCheck(vo);
		
		ModelAndView mav = new ModelAndView();
		if(logVO==null) { //로그인실패
			mav.setViewName("redirect:loginForm");
		}else {//로그인 성공
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logName", logVO.getUsername());
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	 	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	} 
}
