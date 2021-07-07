package com.bitcamp.home;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/init.do")
public class InitParameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public InitParameterServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 //web.xml의 init-param 변수 데이터 가져오기
		String userid = getInitParameter("userid");
		String userpwd = getInitParameter("userpwd");
		String username = getInitParameter("username");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		String html = "<html><head><title>Init Test</title>";
		html += "<style> li:{color:blue}</style></head><body>";
		html += "<ul><li>아이디 : " +userid+ "</li>";
		html += "<li>비밀번호 : " +userpwd+ "</li>";
		html += "<li>이름 : " +username+ "</li></ul></body></html>";
		
		pw.println(html);
		
	}

}
