package com.beetmall.sshj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.dao.ProductDAO;
import com.beetmall.sshj.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService {
	//dao 객체를 주입해야함
	@Inject
	ProductDAO productDAO;

	@Override
	public List<ProductVO> productAllSelect() {
		return productDAO.productAllSelect();
	}

	@Override
	public List<ProductVO> discountSelect() {
		return productDAO.discountSelect();
	}

	@Override
	public List<ProductVO> optionSelect() {
		return productDAO.optionSelect();
	}
	@Override
	public int productInsert(ProductVO vo) {
		return productDAO.productInsert(vo);
	}


}
