package com.bitcamp.jdbc.board;

import java.util.List;

public interface BoardReplyDAOImpl {

	//댓글 쓰기
	public int replyInsert(BoardReplyVO vo);
	//댓글 수정
	public int replyUpdate(BoardReplyVO vo);
	//댓글 삭제
	public int replyDelete(int num, String userid);
	//해당 글의 댓글 전체 목록
	public List<BoardReplyVO> replyAllRecord(int no);
}
