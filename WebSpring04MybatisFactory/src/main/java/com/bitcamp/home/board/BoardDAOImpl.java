package com.bitcamp.home.board;

import java.util.List;

public interface BoardDAOImpl {
	//리스트
	public List<BoardVO> allList();
	
	//글쓰기
	public int boardInsert(BoardVO vo);
	
	//글보기
	public BoardVO boardSelect(int no);
	
	//수정
	public int boardUpdate(int no, String subject, String content, String userid);
	
	//삭제
	public int boardDelete(int no, String userid);
	
}
