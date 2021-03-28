package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/test.do") //mapping 주소
public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    public ServletTest() {
        super(); 
    } 
	// goGet(), doPost()메서드가 호출되기 전에 실행되는 메서드(필요없으면 생략 가능) 
	public void init(ServletConfig config) throws ServletException { 
		System.out.println("init()메서드 실행됨");
	}
	//접속을 get 방식으로 했을 때 호출되는 메서드
 	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
 										//값을 받아옴                값을 내보냄
 		System.out.println("doGet()메서드 실행됨");
 		System.out.println("num="+req.getParameter("num"));
 		
 		//세션의 아이디와 이름을 얻어오기
 		HttpSession ses= req.getSession();
 		String userid = (String)ses.getAttribute("logId");
 		String username = (String)ses.getAttribute("logName");
 		
 		//접속자에게 정보 보내기(I.O)
 		res.setContentType("text/html; charset=UTF-8");
 		PrintWriter pw = res.getWriter();
 		pw.println("<html>");
 		pw.println("<head><title>서블릿을 이용한 홈페이지 </title></head>");
 		
 		pw.println("<script>");
 		pw.println("document.write('자바스크립트에 출력')");
 		pw.println("</script>");
 		pw.println("</head>");
 		
 		pw.println("<body>");
 		pw.println("<h1>서블릿 홈페이지 테스트 / "+userid+", "+username+"</h1>");
 		pw.println("</body>");
 		pw.println("</html>");
 	}
 	//접속을 post 방식으로 했을 때 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()메서드 실행됨");
	}

}
