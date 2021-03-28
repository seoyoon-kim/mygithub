package com.bitcamp.home.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class AjaxZipSearchCommand implements CommandService {

	@Override                    //JSP에서 검색한 도로명이 req에 들어온다
	public String processStart(HttpServletRequest req, HttpServletResponse rese) throws ServletException, IOException {
		 String doro = req.getParameter("doro");
		 
		 // 우편번호 DB 검색
		 MemberDAO dao = MemberDAO.getInstance();
		 List<ZipCodeVO> list = dao.zipcodeSearchSelect(doro);
		 
		 req.setAttribute("list",  list ); //AjaxZipList에 보낼 새로운 변수명, 검색된 list 객체
		return "/member/AjaxZipList.jsp";
	}

}
