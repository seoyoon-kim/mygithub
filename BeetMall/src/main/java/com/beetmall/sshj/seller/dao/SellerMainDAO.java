package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SellerMainVO;

public interface SellerMainDAO {
	// 주문, 매출 불러오기
	public List<SellerMainVO> getOrderSales(SellerMainVO vo);
	// 배송, 클레임 내역 불러오기
	public List<SellerMainVO> getDeliveryStatus(SellerMainVO vo);
	// 공지사항 불러오기
	public List<SellerMainVO> getNotice(SellerMainVO vo);
	// 리뷰 불러오기
	public SellerMainVO getReview(SellerMainVO vo);
	// 문의 불러오기
	public SellerMainVO getQboard(SellerMainVO vo);
	// 매출 차트
	public List<SellerMainVO> getPayData(int num,String userid);
}
