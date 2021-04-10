package com.bitcamp.jdbc.board;

import java.util.List;

public interface BoardDAOImp {

	//글 전체 선택
	public List<BoardVO> boardAllRecord();
	//글 1개 선택
	public BoardVO boardOneRecord(int no);
	//글쓰기(글 등록)
	public int boardInsertRecord(BoardVO vo);
	//글 수정
	public int boardUpdateRecord(BoardVO vo);
	//글 삭제
	public int boardDeleteRecord(int no, String userid);
	//조회수 증가
	public void hitCount(int no);
	
}
