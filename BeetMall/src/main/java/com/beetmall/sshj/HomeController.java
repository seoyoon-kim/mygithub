package com.beetmall.sshj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/home";
	}
	@RequestMapping("error")
	public String errer() {
		return "etc/error";
	}
	@RequestMapping("register")
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
	@RequestMapping("infoView")
	public String infoView() {	// 약관조회
		return "info/infoView";
	}
	@RequestMapping("mypoint")
	public String myPoint() {	// 마이포인트
		return "mypages/mypoint";
	}
	@RequestMapping("mybuyList")
	public String myBuyList() {	// 구매내역
		return "mypages/mybuyList";
	}
	@RequestMapping("myChatList")
	public String myChatList() {	// 구매내역
		return "mypages/myChatList";
	}
}
