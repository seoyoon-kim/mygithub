package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class ZipSearchCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse rese) throws ServletException, IOException {
		 //
		return "/member/zipSearch.jsp";
	}

}
