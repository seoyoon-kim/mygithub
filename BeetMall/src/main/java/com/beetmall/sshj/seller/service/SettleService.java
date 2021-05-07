package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SettleVO;

public interface SettleService {
	// 주문 건별 매출일자 데이터 가져오기
	public List<SettleVO> getOrderDateData(SettleVO vo);
	// 주문건별 정산일자 데이터 가져오기
	public List<SettleVO> getOrderSettleData(SettleVO vo);
	
	// 날짜 정산 날짜 데이터 가져오기
	public List<SettleVO> getDateData(SettleVO vo);
	// 날짜 매출일자 데이터 가져오기
	public List<SettleVO> getSettleData(SettleVO vo);
	
	// 정산금액 합계 가져오기
	public List<SettleVO> totalSettle(SettleVO vo);
}
