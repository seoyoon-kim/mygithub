package com.beetmall.sshj.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerEditFarmDAO;
import com.beetmall.sshj.seller.vo.SellerEditFarmVO;
import com.beetmall.sshj.seller.vo.SellerIntroFarmVO;

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
	public String getImgName(int storenum) {
		// TODO Auto-generated method stub
		return dao.getImgName(storenum);
	}

	@Override
	public int farmUpdate(SellerEditFarmVO vo) {
		// TODO Auto-generated method stub
		return dao.farmUpdate(vo);
	}

	@Override
	public int sellerUpdate(SellerEditFarmVO vo) {
		// TODO Auto-generated method stub
		return dao.sellerUpdate(vo);
	}

	@Override
	public SellerEditFarmVO discountSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.discountSelect(userid);
	}




	
}
