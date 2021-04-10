package com.bitcamp.home.board;

import java.util.List;

public interface BoardReplyDAOImpl {
	public int replyInsert(final BoardReplyVO vo) ;
	
	public int replyUpdate(BoardReplyVO vo);
	
	public int replyDelete(int num, String userid);
	
	public List<BoardReplyVO> replyAllRecord(int no) ;
	
	
}
