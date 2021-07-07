package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.bitcamp.home.member.MemberDAO;

public class WriteOkCommand implements CommandService {

	@Override
	//view에서 정보를 서버로 가져오기
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		String sesUserid = (String)ses.getAttribute("userid");
		String viewFilename = "";
		if(sesUserid!=null && !sesUserid.equals("")) { //로그인 됐을 때
			req.setCharacterEncoding("UTF-8");//req로 받아올 때 한글 세팅(post는 한글이 깨진다)
			
			//글 등록 - 데이터를 가져온다.
			BoardVO vo = new BoardVO();  
			vo.setSubject(req.getParameter("subject")); //제목
			vo.setContent(req.getParameter("content")); //내용 
			vo.setUserid(sesUserid);//글쓴이
			vo.setIp(req.getRemoteAddr());//IP 
			
			//DAO에서 DB작업
			BoardDAO dao = new BoardDAO();
			int cnt = dao.oneRecordInsert(vo);
			
			req.setAttribute("cnt", cnt);
			
			viewFilename = "/board/writeOk.jsp";
		}else { // 로그인 아닐 때 
			viewFilename = "/member/login.jsp";
		}  
		return viewFilename;
	} 
}
