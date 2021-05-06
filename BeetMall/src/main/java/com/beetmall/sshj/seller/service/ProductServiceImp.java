package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.ProductDAO;
import com.beetmall.sshj.seller.vo.ProductVO;



@Service
public class ProductServiceImp implements ProductService {
	//dao 객체를 주입해야함
	@Inject
	ProductDAO productDAO;
	
	@Override
	public int productInsert(ProductVO vo) {
		return productDAO.productInsert(vo);
	}

	@Override
	public List<ProductVO> productAllSelect(String userid) {
		return productDAO.productAllSelect(userid) ;
	}


}
