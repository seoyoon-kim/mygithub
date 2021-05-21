package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.AdminReviewVO;
 

public interface AdminReviewService {

	public List<AdminReviewVO> reviewListA(Admin_Board_PageVO pageVO); 
	
	 
}
