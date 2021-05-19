package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerIntroFarmDAO;
import com.beetmall.sshj.seller.vo.SellerIntroFarmVO;

@Service
public class SellerIntroFarmServiceImp implements SellerIntroFarmService {
	@Autowired
	SellerIntroFarmDAO dao;

	@Override
	public SellerIntroFarmVO selectInfo(String userid) {
		return dao.selectInfo(userid);
	}

	@Override
	public int selectFavorite(String userid) {
		return dao.selectFavorite(userid);
	}

	@Override
	public SellerIntroFarmVO discountSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.discountSelect(userid);
	}
	
	
}
