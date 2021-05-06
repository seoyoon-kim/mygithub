package com.beetmall.sshj.dao;

import java.util.List;

import com.beetmall.sshj.vo.ProductVO;


public interface ProductDAO {
	//판매상품 목록 보기
	public List<ProductVO> productAllSelect();
	//할인 정보 보기
	public List<ProductVO> discountSelect();
	//옵션 정보 보기
	public List<ProductVO> optionSelect();
	//상품 등록하기
	public int productInsert(ProductVO vo);

}
