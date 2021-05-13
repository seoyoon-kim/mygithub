package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerReviewDAO;
import com.beetmall.sshj.seller.vo.SellerReviewVO;

@Service
public class SellerReviewServiceImp implements SellerReviewService{

	@Autowired
	SellerReviewDAO dao;
	
	@Override
	public List<SellerReviewVO> breakdown(String userid) {
		// TODO Auto-generated method stub
		return dao.breakdown(userid);
	}

	@Override
	public List<SellerReviewVO> reviewlist(SellerReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewlist(vo);
	}

	@Override
	public List<SellerReviewVO> reviewlistRecord(SellerReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewlistRecord(vo);
	}

	@Override
	public int answerUpdate(SellerReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.answerUpdate(vo);
	}

	@Override
	public int reviewReportUpdate(SellerReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewReportUpdate(vo);
	}

	@Override
	public int reportInsert(SellerReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reportInsert(vo);
	}
	
}
