package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SaleDAO;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Service
public class SaleServiceImp implements SaleService {
	@Inject
	SaleDAO saleDAO;


	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		return saleDAO.totalRecord(sapvo);
	}

	@Override
	public List<OrderSaleVO> saleList(SearchAndPageVO sapvo) {
		// TODO Auto-generated method stub
		return saleDAO.saleList(sapvo);
	}

	@Override
	public List<OrderSaleVO> oneRecordSelect(String ordernum) {
		// TODO Auto-generated method stub
		return saleDAO.oneRecordSelect(ordernum);
	}

	@Override
	public int claimStatusUpdate(String ordernum, String claimstatus) {
		// TODO Auto-generated method stub
		return saleDAO.claimStatusUpdate(ordernum, claimstatus);
	}

}