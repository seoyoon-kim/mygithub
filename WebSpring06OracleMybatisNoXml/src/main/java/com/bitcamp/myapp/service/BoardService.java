package com.bitcamp.myapp.service;

import java.util.List;

  
import com.bitcamp.myapp.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> allList(String searchKey, String searchWord);
	public BoardVO boardSelect(int no);    
	public int boardInsert(BoardVO vo);
	
	 
	 
}
