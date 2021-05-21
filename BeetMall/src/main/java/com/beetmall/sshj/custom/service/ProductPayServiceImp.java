package com.beetmall.sshj.custom.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.ProductPayDAO;
import com.beetmall.sshj.custom.vo.ProductPayVO;

@Service
public class ProductPayServiceImp implements ProductPayService {
	
	@Inject
	ProductPayDAO productPayDAO;

	@Override
	public ProductPayVO productPay(String userid, int productnum) {
		return productPayDAO.productPay(userid, productnum);
	}

	@Override
	public ProductPayVO productPaySame(String userid) {
		return productPayDAO.productPaySame(userid);
	}

	@Override
	public void PointUpdate(int point, String userid) {
		productPayDAO.PointUpdate(point, userid);
	}

	@Override
	public void insertordertbl(ProductPayVO pro) {
		productPayDAO.insertordertbl(pro);
	}

	@Override
	public void inserOrderDetail(ProductPayVO pro) {
		productPayDAO.inserOrderDetail(pro);	
	}

	@Override
	public void UpdatePoint(int orderprice, String userid) {
		productPayDAO.UpdatePoint(orderprice, userid);
	}

	@Override
	public void usedPoint(ProductPayVO pro) {
		productPayDAO.usedPoint(pro);
	}

	@Override
	public void savePoint(ProductPayVO pro) {
		productPayDAO.savePoint(pro);
	}
}
