package com.bitcamp.home.board;

import java.util.List;

public interface BoardDAOService {
	//레코드 추가(글쓰기)-insert
	public int oneRecordInsert(BoardVO vo); 
	
	//레코드 1개 선택 (글 내용 보기, 글 수정 폼)-select
	public void oneRecordSelect(BoardVO vo);
	//or public BoardVO oneRecordSelect(BoardVO vo);
	
	//레코드 삭제 (글 삭제)
	public int boardDelete(int no, String userid);
	
	//조회수 증가
	public void hitCount(int no);

	//총 레코드 수
	public int totalRecord(PageSearchVO vo);
	
	//레코드 수정(글 수정) - update
	public int boardUpdate(BoardVO vo);
	
	//한 페이지에 띄워지는 레코드 선택
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo);
	
	//글쓴이 선택
	public String getUserid(int no);
}
