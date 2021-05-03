package com.beetmall.sshj.service;

import java.util.List;

import com.beetmall.sshj.vo.ProductVO;

public interface ProductService {
	//판매상품 목록 보기
	public List<ProductVO> productAllSelect();
	//상품 등록하기
	public int productInsert(ProductVO vo);
}
