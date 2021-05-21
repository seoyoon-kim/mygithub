package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.AdminReviewVO; 
  
public interface AdminReviewDAO {
	public List<AdminReviewVO> reviewListA(Admin_Board_PageVO pageVO); //공지 글 목록 보기 
}
