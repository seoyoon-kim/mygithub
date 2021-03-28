package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Login() {
        super(); 
    }
    //get 방식 접속
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 폼
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><head><title>로그인</title></head>");
		pw.println("<body>");
		pw.println("<h1>로그인 폼</h1>");
		pw.println("<form method='post' action='login.do'>");
		pw.println("아이디 : <input type='text' name='userid' /><br/>");
		pw.println("비밀번호 : <input type='password' name='userpwd'/><br/>");
		pw.println("<input type='submit' value='로그인'/></form>"); 
	}
	//post 방식 접속
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 : DB검색
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//1. 드라이브 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. DB연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "c##scott","tiger");
			
			//아이디, 비밀번호 가져오기
			String userid = request.getParameter("userid");
			String userpwd = request.getParameter("userpwd");
			//3. PreparedStatement
			pstmt = con.prepareStatement("select userid, username from register where userid=? and userpwd=?");
			
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			
			//4. 실행
			rs = pstmt.executeQuery();
			
			//로그인 결과 처리(클라이언트에게 알려주기)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			
			if(rs.next()) { //로그인 성공 시 
				HttpSession session = request.getSession();
				session.setAttribute("logId", rs.getString(1));
				session.setAttribute("logName", rs.getString(2));
				
				pw.println("<script>alert('로그인 성공하였습니다.홈페이지로 이동합니다.');"
						+ " location.href='test.do';"
						+ "</script>");
			}else { //로그인 실패 시
				pw.println("<script>alert('로그인 실패하였습니다. 다시 로그인 하세요.');"
						+"history.back();</script>");
			}   
		}catch(Exception e) {
			System.out.println("로그인 에러 발생 ->"+e.getMessage());
		}finally {
			//5. DB닫기
			try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
			}catch(Exception ee) {
				System.out.println("DB 닫기 에러 발생->"+ee.getMessage());
			}
		}
	} 
}
