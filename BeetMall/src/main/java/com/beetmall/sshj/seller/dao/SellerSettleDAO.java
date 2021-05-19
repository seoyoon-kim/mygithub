package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SellerSettleVO;

public interface SellerSettleDAO {
	// 주문 건별 매출일자 데이터 가져오기
	public List<SellerSettleVO> getOrderDateData(SellerSettleVO vo);
	// 주문건별 정산일자 데이터 가져오기
	public List<SellerSettleVO> getOrderSettleData(SellerSettleVO vo);
	
	// 날짜 정산 날짜 데이터 가져오기
	public List<SellerSettleVO> getDateData(SellerSettleVO vo);
	// 날짜 매출일자 데이터 가져오기
	public List<SellerSettleVO> getSettleData(SellerSettleVO vo);
	
	// 매출일자 합계 구하기
	public List<SellerSettleVO> totalOrder(SellerSettleVO vo);
	
	// 정산일자 합계 구하기
	public List<SellerSettleVO> totalSettle(SellerSettleVO vo);
	
	
	
	
	
	// 조회기준 날짜 기준일때 매출일자 토탈 레코드   + 엑셀 다운위한 데이터 전체 불러오기용
	public List<SellerSettleVO> getDateDataTotalRecord(SellerSettleVO vo);
	
	// 조회기준 날짜 기준일때 정산날짜 토탈 레코드   + 엑셀 다운위한 데이터 전체 불러오기용
	public List<SellerSettleVO> getSettleDataTotalRecord(SellerSettleVO vo);
	
	
	// 엑셀 다운위한 데이터 전체 불러오기
	public List<SellerSettleVO> excelOrderDateData(SellerSettleVO vo);
	
	// 엑셀 다운위한 데이터 전체 불러오기
	public List<SellerSettleVO> excelOrderSettleData(SellerSettleVO vo);
}
