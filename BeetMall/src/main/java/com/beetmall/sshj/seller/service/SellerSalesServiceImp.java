package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerSalesDAO;
import com.beetmall.sshj.seller.vo.SellerSalesVO;

@Service
public class SellerSalesServiceImp implements SellerSalesService {

	@Autowired
	SellerSalesDAO dao;
	
	@Override
	public List<SellerSalesVO> allCategoryList() {
		return dao.allCategoryList();
	}

	@Override
	public List<SellerSalesVO> salesDataList(SellerSalesVO vo) {
		return dao.salesDataList(vo);
	}

}
