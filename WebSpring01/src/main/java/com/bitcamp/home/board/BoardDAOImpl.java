package com.bitcamp.home.board;

import java.util.List;

public interface BoardDAOImpl {

	//글 등록(레코드 추가)
	public int boardInsert(BoardVO vo);
	//글 전체 선택
	public List<BoardVO> boardAllRecord();
	//글 1개 레코드 선택
	public void boardSelect(BoardVO vo);
	//또는 public BoardVO boardSelect(int no);
	
	//글 수정
	public int boardUpdate(BoardVO vo);
	//글 삭제
	public int boardDelete(BoardVO vo);
	//조회수 증가
	public void hitCount(int no);
	
	
}
