package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class MemberOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse rese) throws ServletException, IOException {
		
		//view에서 정보를 서버로 가져오기
		req.setCharacterEncoding("UTF-8");//(post는 한글이 깨진다)
		MemberVO vo = new MemberVO();
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd"));
		vo.setUsername(req.getParameter("username"));
		vo.setTel1(req.getParameter("tel1"));
		vo.setTel2(req.getParameter("tel2"));
		vo.setTel3(req.getParameter("tel3"));
		vo.setEmailid(req.getParameter("emailid"));
		vo.setEmaildomain(req.getParameter("emaildomain"));
		vo.setZipcode(req.getParameter("zipcode"));
		vo.setAddr(req.getParameter("addr"));
		vo.setDetailaddr(req.getParameter("detailaddr"));
		vo.setInterest(req.getParameterValues("interest"));
		
		//DB에 레코드를 추가하기
		MemberDAO dao = MemberDAO.getInstance();
		int cnt = dao.setNewMember(vo);
		
		//다음 페이지 view로 보내기
		req.setAttribute("cnt", cnt); //cnt를 받아서 새 변수"cnt"로 보낸다
		
		return "/member/memberResult.jsp";
	}

}
