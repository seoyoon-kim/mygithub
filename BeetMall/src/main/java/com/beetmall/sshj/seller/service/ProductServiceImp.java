package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.ProductDAO;
import com.beetmall.sshj.seller.vo.DiscountVO;
import com.beetmall.sshj.seller.vo.OptionVO;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;



@Service
public class ProductServiceImp implements ProductService {
	//dao 객체를 주입해야함
	@Inject
	ProductDAO productDAO;

	
	 @Override public List<ProductVO> searchList(SearchAndPageVO spvo) { 
		 return productDAO.searchList(spvo); 
	 }
	 
	@Override
	public int productInsert(ProductVO vo) {
		return productDAO.productInsert(vo);
	}

	@Override
	public List<ProductVO> productAllSelect(String userid) {
		return productDAO.productAllSelect(userid) ;
	}

	@Override
	public int totalProduct(SearchAndPageVO spvo) {
		return productDAO.totalProduct(spvo);
	}

	@Override
	public List<ProductVO> onePageRecordSelect(SearchAndPageVO spvo) {
		return productDAO.onePageRecordSelect(spvo);
	}

	@Override
	public int discountInsert(DiscountVO dvo) {
		return productDAO.discountInsert(dvo);
	}

	@Override
	public int optionInsert(OptionVO ovo) {
		return productDAO.optionInsert(ovo);
	}



}
