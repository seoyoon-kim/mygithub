package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class EditOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		BoardVO vo = new BoardVO();
		PageSearchVO pVO = new PageSearchVO();
		BoardDAO dao = new BoardDAO();
		
		vo.setUserid((String)req.getSession().getAttribute("userid"));
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		String dbUserid = dao.getUserid(vo.getNo());//글쓴이 알아내기 : BoardDAOService 인터페이스에 메서드 추가
		
		//로그인 확인하기
		String viewFile = "";
		if(vo.getUserid()==null || vo.getUserid().equals("")) { //로그인 안 되어있음
			viewFile = "/member/login.jsp";
		}else if(!dbUserid.equals(vo.getUserid())){//로그인 되어있으나 글쓴이가 아니다
			req.setAttribute("result", 100); // 정상 로그인의 result = 0 or 1, 비정상 로그인이므로 100을 보낸다
			viewFile = "/board/editOk.jsp";
		}else { //정상적인 로그인의 경우
			vo.setSubject(req.getParameter("subject"));
			vo.setContent(req.getParameter("content"));
			
			pVO.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			pVO.setSearchKey(req.getParameter("searchKey"));
			pVO.setSearchWord(req.getParameter("searchWord"));
			
			int result = dao.boardUpdate(vo);
			req.setAttribute("result", result);//result = 0 or 1
			req.setAttribute("addrParam", createParameter(pVO, vo.getNo())); //아래 createParameter 메서드 이용
			
			viewFile = "/board/editOk.jsp"; 
			}
		return viewFile;
	}
	
	public String createParameter(PageSearchVO pVO, int no) {
		String addrParam = "no="+no+"&pageNum="+pVO.getPageNum();
		if(pVO.getSearchWord()!=null && !pVO.getSearchWord().equals("")) {
			addrParam += "&searchKey="+pVO.getSearchKey()+"&searchWord="+pVO.getSearchWord();
		}
		return addrParam;
	}
}
