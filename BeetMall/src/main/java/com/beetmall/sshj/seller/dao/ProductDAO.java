package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

public interface ProductDAO {
	//검색
	public List<ProductVO> searchList(SearchAndPageVO spvo);
	//판매자 판매상품 목록 전체 보기
	public List<ProductVO> productAllSelect(String userid); 
	//등록된 상품 갯수 ( 총 레코드 수)
	public int totalProduct(SearchAndPageVO spvo);
	//한페이지에 해당하는 상품 갯수 선택 ( 레코드 선택)
	public List<ProductVO> onePageRecordSelect(SearchAndPageVO spvo);
	
	
	//상품 등록하기
	public int productInsert(ProductVO vo);
	//상품 수정하기 
	public int productUpdate(ProductVO vo);
	
}