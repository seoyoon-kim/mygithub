package com.beetmall.sshj;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		if(session.getAttribute("logStop") != null) {
			session.removeAttribute("logStop");
		}
		if(session.getAttribute("Type") != null) {
			session.removeAttribute("Type");
		}
		if(session.getAttribute("stopdate") != null) {
			session.removeAttribute("stopdate");
		}
		return "home";
	}
}
