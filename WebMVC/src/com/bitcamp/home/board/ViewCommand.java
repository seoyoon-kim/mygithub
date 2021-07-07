package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class ViewCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 //1. 데이터를 request : no, pageNum(at BoardVO)/ searchKey, searchWord(at PageServiceVO)
		BoardVO vo = new BoardVO();
		PageSearchVO pVO = new PageSearchVO();
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));//<a href="......boardView/do?no=" <-no
		pVO.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
		pVO.setSearchKey(req.getParameter("searchKey"));
		pVO.setSearchWord(req.getParameter("searchWord"));
		
		//2. DB조회
		BoardDAO dao = new BoardDAO();
		dao.hitCount(vo.getNo());
		dao.oneRecordSelect(vo);//해당 레코드 선택
		
		//3. 필요한 데이터 request 세팅
		req.setAttribute("vo", vo);
		req.setAttribute("pVO", pVO);
		
		String delAddr = "no="+vo.getNo()+"&pageNum="+pVO.getPageNum();
		if(pVO.getSearchWord()!=null && !pVO.getSearchWord().equals("")) {
			delAddr += "&searchKey="+pVO.getSearchKey()+"&searchWord="+pVO.getSearchWord();
		}
		
		req.setAttribute("delAddr", delAddr);
		
		return "/board/boardView.jsp";
	}

}
