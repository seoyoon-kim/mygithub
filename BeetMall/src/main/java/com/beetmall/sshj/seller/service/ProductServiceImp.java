package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.ProductDAO;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;



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
	public List<ProductVO> productAllSelect(SearchAndPageVO sapvo){
		return productDAO.productAllSelect(sapvo);
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
	public int discountInsert(ProductVO vo) {
		return productDAO.discountInsert(vo);
	}

	@Override
	public int optionInsert(ProductVO vo) {
		return productDAO.optionInsert(vo);
	}

	@Override
	public int productDelete(int productnum) {
		return productDAO.productDelete(productnum);
	}

	@Override
	public int productUpdate(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.productUpdate(vo);
	}



}