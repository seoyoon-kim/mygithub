package com.beetmall.sshj.custom.controller;

import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MemberService;
import com.beetmall.sshj.custom.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService memberservice;
	@Inject
	JavaMailSenderImpl mailSender;
	
	@RequestMapping("login")	// 로그인 페이지
	public String login() {	
		return "login/login";	
	}
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
	
	@RequestMapping("idOverLap")
	@ResponseBody
	public int idCheck(HttpServletRequest req) {
		String id = req.getParameter("Checkid");
		System.out.println("id = "+id);
		int result = memberservice.idOverlap(id);
		System.out.println("result = "+result);
		
		return result;
	}
	
	@RequestMapping(value="userinfo", method = RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String infoSelect(HttpServletRequest req) {
		String info = req.getParameter("infoname");
		System.out.println(info);
		String result = memberservice.infoSelect(info);
		return result;
	}
	
	// 로그인
	@RequestMapping(value="loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = memberservice.loginOk(userid, userpwd);
		
		if(!vo.getUserstop().equals("Y")) {
			if(vo.getUserid()!= null && !vo.getUserid().equals("")) {
				session.setAttribute("logId",vo.getUserid());
				session.setAttribute("logName", vo.getUsername());
				session.setAttribute("logStatus", "Y");
				session.setAttribute("logType", vo.getUsertype());
				mav.setViewName("redirect:/");
			}else {
				mav.setViewName("redirect:login");
			}
		}else {
			mav.addObject("logStop","Y");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logoutOk(HttpSession session) {
		session.invalidate();
		return "home";
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
	
	// 이메일 인증
//	@RequestMapping("emailSend")
//	@ResponseBody
//	public String sendemail(HttpSession session, HttpServletRequest req) {
//		String userEmail = req.getParameter("SendToEmail");
//		UUID random = UUID.randomUUID();
//		String uuid = random.toString();
//		String subject = "메일보내기 연습중(제목부분)"; // 메일 제목부분
//		String content = "<div style='background:lightblue;border:1px solid gray;"
//				+ "border-radius:5px;margin:30px;padding:30px;width:80%'>"
//				+ "<h1>이 이메일은 회원가입을 위한 인증코드입니다.</h1>"
//				+ "<p style='font-size:1.5em'>인증코드:<span style='color:#00f'>"+uuid+"</span></p>"
//				+ "<div>";
//		try {
//			MimeMessage message = MailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//			messageHelper.setFrom("beetamll@naver.com"); //보내는 메일주소
//			messageHelper.setTo(userEmail); //받는 메일주소
//			messageHelper.setSubject(subject); // 보내는 제목
//			messageHelper.setText("text/html;charset=UTF-8", content);
//			mailSender.send(message);
//			session.setAttribute("emailUUID", uuid);
//		}catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("이메일 인증 에러");
//		}
//		return "";
//	}
	//이메일 인증
	@RequestMapping(value="emailSend", method=RequestMethod.GET, produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String sendemail(HttpSession session, HttpServletRequest req) {
		String userEmail = req.getParameter("SendToEmail");
		System.out.println("userrEmail="+userEmail);
		UUID random = UUID.randomUUID();
		System.out.println("random="+random);
		String uuid = random.toString();
		System.out.println("uuid"+uuid);
		String subject = "메일보내기 연습중(제목부분)"; // 메일 제목부분
		String content = "<div style='background:lightblue;border:1px solid gray;"
				+ "border-radius:5px;margin:30px;padding:30px;width:80%'>"
				+ "<h1>이 이메일은 회원가입을 위한 인증코드입니다.</h1>"
				+ "<p style='font-size:1.5em'>인증코드:<span style='color:#00f'>"+uuid+"</span></p>"
				+ "<div>";
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8" );
				helper.setFrom("beetamll@naver.com");
				helper.setTo(userEmail);
				helper.setSubject(subject);
				helper.setText(content);
			}
		};
		mailSender.send(preparator);
		return "성공";
	}
	@RequestMapping("regiFinish")
	public String regiFinish() {	// 회원가입 완료
		return "login/registerFinish";	
	}
}
