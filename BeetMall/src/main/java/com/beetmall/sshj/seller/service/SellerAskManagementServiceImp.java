package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerAskManagementDAO;
import com.beetmall.sshj.seller.dao.SellerReviewDAO;
import com.beetmall.sshj.seller.vo.SellerAskManagementVO;
import com.beetmall.sshj.seller.vo.SellerReviewVO;

@Service
public class SellerAskManagementServiceImp implements SellerAskManagementService{

	@Autowired
	SellerAskManagementDAO dao;
	
	@Override
	public List<SellerAskManagementVO> breakdown(String userid) {
		// TODO Auto-generated method stub
		return dao.breakdown(userid);
	}

	@Override
	public List<SellerAskManagementVO> asklist(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.asklist(vo);
	}

	@Override
	public int reportInsert(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.reportInsert(vo);
	}

	@Override
	public List<SellerAskManagementVO> asklistRecord(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.asklistRecord(vo);
	}

	@Override
	public int askUpdate(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.askUpdate(vo);
	}

	@Override
	public int askAnswerUpdate(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.askAnswerUpdate(vo);
	}
	
}
