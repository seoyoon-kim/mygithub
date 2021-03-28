package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class IdCheckCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse rese) throws ServletException, IOException {
		 //DB를 조회 : id 있는지 없는지 결과를 가지고 view로 간다.
		String userid = req.getParameter("userid");
		
		//아이디 중복검사
		MemberDAO dao = new MemberDAO();
		boolean result = dao.idCheck(userid);
		
		//request객체에 필요한 데이터를 저장 후 view 페이지로 이동
		req.setAttribute("userid", userid); //변수이름, 값
		req.setAttribute("checkResult", result);
		return "/member/idCheck.jsp";
	}

}
