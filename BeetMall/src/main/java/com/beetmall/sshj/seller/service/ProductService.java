package com.beetmall.sshj.seller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;


public interface ProductService {

	//판매자 판매상품 목록 전체 보기
	public List<ProductVO> productAllSelect(SearchAndPageVO sapvo); 
	//등록된 상품 갯수 ( 총 레코드 수)
	public int totalRecord(SearchAndPageVO sapvo);
	//한페이지에 해당하는 상품 갯수 선택 ( 레코드 선택)
	public List<ProductVO> onePageRecordSelect(int productnum); 
	 
	//상품 등록하기
	public int productInsert(ProductVO vo);
	//할인 등록하기
	public int discountInsert(ProductVO vo);
	//옵션 등록하기
	public int optionInsert(ProductVO vo);
	//상품 삭제하기
	public int productDelete(int productnum);
}