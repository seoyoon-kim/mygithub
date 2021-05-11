package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SettleReviewDAO;
import com.beetmall.sshj.seller.vo.SettleReviewVO;

@Service
public class SettleReviewServiceImp implements SettleReviewService{

	@Autowired
	SettleReviewDAO dao;
	
	@Override
	public List<SettleReviewVO> breakdown(String userid) {
		// TODO Auto-generated method stub
		return dao.breakdown(userid);
	}
	
}
