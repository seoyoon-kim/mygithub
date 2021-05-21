package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.AdminBoardDAO; 
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.PageSearchVO; 
 
@Service
public class Admin_BoardServiceImp implements Admin_BoardService {
	
	@Inject
	AdminBoardDAO boardDAO;

	@Override
	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO) { 
		return boardDAO.noticeBoardList(pageVO);
	}
 
	@Override
	public int noticeBoardWrite(AdminBoardVO vo) { 
		return boardDAO.noticeBoardWrite(vo);
	}

	@Override
	public int boardDelA(int infonum) { 
		return boardDAO.boardDelA(infonum);
	}
 

	@Override
	public int boardUpdate(AdminBoardVO vo) { 
		return boardDAO.boardUpdateA(vo);
	}
 
  
	  
	 
	  
}
