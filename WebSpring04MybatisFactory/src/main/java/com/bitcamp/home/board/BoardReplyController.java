package com.bitcamp.home.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardReplyController {
		@RequestMapping("/replyWriteOk")
		@ResponseBody          //원래 글 번호, 댓글 / 
		public String replyWriteOk(BoardReplyVO vo, HttpServletRequest req) {
			vo.setUserid((String)req.getSession().getAttribute("logId"));
			vo.setIp(req.getRemoteAddr());
			
			BoardReplyDAO dao = new BoardReplyDAO();
			return dao.replyInsert(vo)+"개 추가되었습니다";
		}
		
		//해당 글의 댓글목록 선택
		@RequestMapping("/replyList")
		@ResponseBody
		public List<BoardReplyVO> replyList(int no) {
			BoardReplyDAO dao = new BoardReplyDAO();
			return dao.replyAllRecord(no);
		}
		
		@RequestMapping("/replyEditOk")
		@ResponseBody
		public String replyEditOk(BoardReplyVO vo, HttpServletRequest req) {
			vo.setUserid((String)req.getSession().getAttribute("logId"));
			BoardReplyDAO dao = new BoardReplyDAO();
			return dao.replyUpdate(vo)+"";
		}
		
		@RequestMapping("/replyDel")
		@ResponseBody
		public String replyDel(int num, HttpServletRequest req) {
			BoardReplyDAO dao = new BoardReplyDAO();
			return dao.replyDelete(num, (String)req.getSession().getAttribute("logId"))+"";
		}
}
