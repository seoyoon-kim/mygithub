package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class LogoutCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//로그아웃
		HttpSession ses = req.getSession();
		System.out.println("sessionId sesId="+ses.getId());
		System.out.println("session MaxInactiveInterval="+ses.getMaxInactiveInterval());
		System.out.println("session LastAccessedTime="+ses.getLastAccessedTime());
		
		//세션지우기
		ses.invalidate();
		
		return "/index.jsp";
	}

}
