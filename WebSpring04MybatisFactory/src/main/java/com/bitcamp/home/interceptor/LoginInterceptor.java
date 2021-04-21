package com.bitcamp.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	// HandlerInterceptor 상속받아 interceptor클래스를 생성한 후 메서드를 오버라이딩한다
	//1. 컨트롤러가 호출되기 전에 먼저 실행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		//로그인 여부를 확인해 로그인 상태인 경우 호출된 컨트롤러가 실행, 
		//                로그인 안된 경우 로그인 페이지로 컨트롤러 이동
		
		//1. 로그인 정보 구하기
		String userid = (String)req.getSession().getAttribute("logId"); //없으면 null
		if(userid==null || userid.equals("")) { //로그인 안된경우
			//로그인으로 이동
			res.sendRedirect(req.getContextPath()+"/loginForm");
			return false; //접속한 컨트롤러의 실행을 중지, 위의 새 컨트롤러로 이동
		}else {//로그인 성공
			
		}	
		return true;//true 리턴시 접속한 컨트롤러를 계속 실행
	}
	//2. 컨트롤러 실행 후 view페이지로 이동하기 전에 호출되는 메서드
	@Override
	public void  postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable ModelAndView modelAndView) throws Exception{
		
	}
	
	//3. 컨트롤러 실행 후 호출되는 메서드
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, @Nullable Exception ex) throws Exception{
		
	}
}

