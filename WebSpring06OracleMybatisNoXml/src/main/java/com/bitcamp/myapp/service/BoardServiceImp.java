package com.bitcamp.myapp.service;

 
import java.util.List; 
import javax.inject.Inject; 
import org.springframework.stereotype.Service; 
import com.bitcamp.myapp.dao.BoardDAO;
import com.bitcamp.myapp.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService {
	@Inject
	BoardDAO dao;
	@Override
	public List<BoardVO> allList(String searchKey, String searchWord) { 
		return dao.allList(searchKey,searchWord);
	}
	@Override
	public BoardVO boardSelect(int no) { 
		return dao.boardSelect(no);
	}
	@Override
	public int boardInsert(BoardVO vo) { 
		return dao.boardInsert(vo);
	}
	 
	 
	
}
 