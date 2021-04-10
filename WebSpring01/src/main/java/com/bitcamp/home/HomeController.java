package com.bitcamp.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class HomeController {
	//jdbc template 담을 변수
	public JdbcTemplate jdbcTemplate; 
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	//메서드 자동실행(homeController가 실행될 때) : servlet-context.xml에 있는 template 객체를 
	//jdbc 템플릿에 대입, constants.jdbcTemplate에도 세팅
	@Autowired
	public void setJdbcTemplate(JdbcTemplate template) { //외부에서 데이터 받아서 jdbctemp 변수에 보내서 저장
		this.jdbcTemplate = template;
		Constants.jdbcTemplate = template;//constants.java 파일로 보낸다
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}
	
}
