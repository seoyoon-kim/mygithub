package com.bitcamp.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexCommand implements CommandService {
 
	public String processStart(HttpServletRequest req, HttpServletResponse rese) throws ServletException, IOException {
	 
		return "index.jsp";  
	}

}
