package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.AdminReviewDAO;
import com.beetmall.sshj.admin.vo.AdminReviewVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO; 
 
@Service
public class AdminReviewServiceImp implements AdminReviewService {
	
	@Inject
	AdminReviewDAO dao;

	@Override
	public List<AdminReviewVO> reviewListA(Admin_Board_PageVO pageVO) { 
		return dao.reviewListA(pageVO);
	}

 
	  
	 
	  
}
