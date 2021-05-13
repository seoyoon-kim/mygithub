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
	public List<SellerAskManagementVO> reviewlistRecord(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewlistRecord(vo);
	}

	@Override
	public int answerUpdate(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.answerUpdate(vo);
	}

	@Override
	public int reviewReportUpdate(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewReportUpdate(vo);
	}

	@Override
	public int reportInsert(SellerAskManagementVO vo) {
		// TODO Auto-generated method stub
		return dao.reportInsert(vo);
	}
	
}
