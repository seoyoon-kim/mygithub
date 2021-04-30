package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.BoardVO;
 

public interface Boardervice {

	public List<BoardVO> noticeList(); 
	public int boardInsert(BoardVO vo);
	public BoardVO boardSelect(int no); 
	public int boardUpdate(BoardVO vo);
	
}
