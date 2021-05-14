package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerSettleDAO;
import com.beetmall.sshj.seller.vo.SellerSettleVO;

@Service
public class SellerServiceImp implements SellerSettleService{
	@Autowired
	SellerSettleDAO dao;
	
	@Override
	public List<SellerSettleVO> getOrderDateData(SellerSettleVO vo) {
		return dao.getOrderDateData(vo);
	}

	@Override
	public List<SellerSettleVO> totalSettle(SellerSettleVO vo) {
		return dao.totalSettle(vo);
	}
	
	@Override
	public List<SellerSettleVO> totalOrder(SellerSettleVO vo) {
		return dao.totalOrder(vo);
	}
	
	@Override
	public List<SellerSettleVO> getOrderSettleData(SellerSettleVO vo) {
		return dao.getOrderSettleData(vo);
	}

	@Override
	public List<SellerSettleVO> getDateData(SellerSettleVO vo) {
		return dao.getDateData(vo);
	}

	@Override
	public List<SellerSettleVO> getSettleData(SellerSettleVO vo) {
		return dao.getSettleData(vo);
	}

	@Override
	public List<SellerSettleVO> getDateDataTotalRecord(SellerSettleVO vo) {
		return dao.getDateDataTotalRecord(vo);
	}

	@Override
	public List<SellerSettleVO> getSettleDataTotalRecord(SellerSettleVO vo) {
		return dao.getSettleDataTotalRecord(vo);
	}

	@Override
	public List<SellerSettleVO> excelOrderDateData(SellerSettleVO vo) {
		return dao.excelOrderDateData(vo);
	}

	@Override
	public List<SellerSettleVO> excelOrderSettleData(SellerSettleVO vo) {
		return dao.excelOrderSettleData(vo);
	}


	
	
	
}
