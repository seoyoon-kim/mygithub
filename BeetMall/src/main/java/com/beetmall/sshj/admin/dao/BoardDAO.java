package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO; 
  
public interface BoardDAO {
	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO); //공지 글 목록 보기
	public int noticeBoardWrite(AdminBoardVO vo); //새 공지 쓰기  
	public int boardUpdateA(AdminBoardVO vo);//공지 수정
	public int boardDelA(int infonum); //공지 삭제 
}
