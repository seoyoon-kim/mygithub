package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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

	
	 @Override public List<ProductVO> searchList(SearchAndPageVO sapvo) { 
		 return productDAO.searchList(sapvo); 
	 }
	 
	@Override
	public int productInsert(ProductVO vo) {
		return productDAO.productInsert(vo);
	}

	@Override
	public List<ProductVO> productAllSelect(String userid){
		return productDAO.productAllSelect(userid);
	}
	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		return productDAO.totalRecord(sapvo);
	}

	@Override
	public List<ProductVO> onePageRecordSelect(SearchAndPageVO sapvo) {
		return productDAO.onePageRecordSelect(sapvo);
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
