package com.bitcamp.home.member;

import java.io.PrintWriter;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@RequestMapping("/login")
	public String login() {
		return "member/loginForm";
	}
	//로그인
	@RequestMapping(value = "/loginOk",method = RequestMethod.POST)
	public ModelAndView loginOk(MemberVO vo, HttpServletRequest req) {
		MemberDAO dao = new MemberDAO();
		dao.login(vo);
		
		String username = vo.getUsername();
		
		//로그인 여부 : 성공 --> 홈, 실패 --> 로그인으로
		ModelAndView mav = new ModelAndView();
		
		if(vo.getUsername()!=null) {//로그인 성공
			HttpSession ses = req.getSession();
			//아이디, 이름, 로그인 상태
			ses.setAttribute("logId", vo.getUserid());
			ses.setAttribute("logName", vo.getUsername());
			ses.setAttribute("logStatus", "Y");
			
			//modelandview에서 뷰파일은 다른 컨트롤러를 직접호출할수 있다.
			mav.addObject("name", username);
			mav.setViewName("redirect:/"); // "/" 하나는 controller를 찾아가는것을 표현한거나
		} else {// 로그인 실패
			mav.setViewName("redirect:login"); // home이 아니면 "/"를 빼고 해도된다.
		}
		
		
		return mav;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		ses.invalidate();
		return "home";
	}
	
	@RequestMapping("/member")
	public String memberForm() {
		
		return "member/memberForm";
	}
	
	@RequestMapping(value="/memberOk",method = RequestMethod.POST)
	public ModelAndView memberOk(MemberVO vo, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		MemberDAO dao = new MemberDAO();
		
		if(dao.memberInsert(vo)>0) { // 회원등록
			mav.setViewName("redirect:login");
		} else { // 회원등록 실패
//			try {
//				res.setContentType("text/html; charset=UTF-8");
//				PrintWriter pw = res.getWriter();
//				pw.print("<html><head><title></title></head><body>"
//						+ "<script>history.back();</script></body></html>");
//				pw.flush();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
			mav.setViewName("member/memberOk");
		}
		return mav;
	}
	
	//회원수정폼
	@RequestMapping("/memberEdit")
	public ModelAndView memberEdit(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = new MemberVO();
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		MemberDAO dao = new MemberDAO();
		
		dao.memberSelect(vo);
		mav.addObject("vo", vo);
		mav.setViewName("member/memberEdit");
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="/memberEditOk",method=RequestMethod.POST)
	public ModelAndView memberEditOk(MemberVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.memberUpdate(vo);
		
		if(result>0) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:memberEdit");
		}
		
		return mav;
	}
}
