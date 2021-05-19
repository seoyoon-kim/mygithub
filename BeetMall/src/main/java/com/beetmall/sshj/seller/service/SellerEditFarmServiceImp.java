package com.beetmall.sshj.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerEditFarmDAO;
import com.beetmall.sshj.seller.vo.SellerEditFarmVO;

@Service
public class SellerEditFarmServiceImp implements SellerEditFarmService {
	@Autowired
	SellerEditFarmDAO dao;

	@Override
	public SellerEditFarmVO selectInfo(String userid) {
		// TODO Auto-generated method stub
		return dao.selectInfo(userid);
	}

	@Override
	public int selectFavorite(String userid) {
		// TODO Auto-generated method stub
		return dao.selectFavorite(userid);
	}

	@Override
	public String getImgName(String userid) {
		// TODO Auto-generated method stub
		return dao.getImgName(userid);
	}



	
}
