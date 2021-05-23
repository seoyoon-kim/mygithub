package com.beetmall.sshj.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;
 

public interface Admin_BoardService {

	public List<AdminBoardVO> noticeBoardList(Admin_Board_PageVO pageVO);   
	public int noticeWriteOk(AdminBoardVO vo); 
	public AdminBoardVO noticeBoardView(int infonum);
	public int noticeBoardDelete(int infonum);   
	public int noticeBoardEditOk(AdminBoardVO vo); 
	 
	
}
