package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.OrderSaleVO;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;

public interface OrderDAO {
	//목록 전체보기
	public List<OrderSaleVO> orderList(SearchAndPageVO sapvo);
	//주문 정보 1개의 레코드만 보기
	public List<OrderSaleVO> oneRecordSelect(String ordernum);
	//주문 상품 갯수( 총 레코드수)
	public int totalRecord(SearchAndPageVO sapvo);
	//해당 주문상태 업데이트
	public int orderStatusUpdate(String ordernum, String orderstatus);
}