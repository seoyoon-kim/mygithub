package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerMainDAO;
import com.beetmall.sshj.seller.vo.SellerMainVO;
@Service
public class SellerMainServiceImp implements SellerMainService {
	
	@Autowired
	SellerMainDAO dao;

	@Override
	public List<SellerMainVO> getOrderSales(SellerMainVO vo) {
		// TODO Auto-generated method stub
		return dao.getOrderSales(vo);
	}

	@Override
	public List<SellerMainVO> getDeliveryStatus(SellerMainVO vo) {
		// TODO Auto-generated method stub
		return dao.getDeliveryStatus(vo);
	}

	@Override
	public List<SellerMainVO> getNotice(SellerMainVO vo) {
		// TODO Auto-generated method stub
		return dao.getNotice(vo);
	}

	@Override
	public SellerMainVO getSales(SellerMainVO vo) {
		// TODO Auto-generated method stub
		return dao.getSales(vo);
	}
	
}
