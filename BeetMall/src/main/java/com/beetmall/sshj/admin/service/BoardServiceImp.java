package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.BoardDAO;
import com.beetmall.sshj.admin.vo.BoardVO;
 
@Service
public class BoardServiceImp implements Boardervice {
	
	@Inject
	BoardDAO boardDAO;
	  
	@Override
	public List<BoardVO> noticeList() { 
		return boardDAO.noticeList();
	}
	 
	@Override//글쓰기 
	public int boardInsert(BoardVO vo) {
		return boardDAO.boardInsert(vo);
	}

	@Override
	public BoardVO boardSelect(int no) { 
		return boardDAO.boardSelect(no);
	} 

	@Override
	public int boardUpdate(BoardVO vo) { 
		return boardDAO.boardUpdate(vo);
	} 

	 
}
