package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import com.beetmall.sshj.seller.dao.SellerFaqDAO;
import com.beetmall.sshj.seller.vo.SellerFaqVO;

public class SellerFaqServiceImp implements SellerFaqService {
	@Inject
	SellerFaqDAO sellerFaqDAO;
	
	@Override
	public List<SellerFaqVO> sellerfaqAllRecord() {
		return sellerFaqDAO.sellerfaqAllRecord();
	}

}
