package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SettleVO;

public interface SettleDAO {
	// 주문 건별 매출일자 데이터 가져오기
	public List<SettleVO> getOrderDateData(SettleVO vo);
	// 주문건별 정산일자 데이터 가져오기
	public List<SettleVO> getOrderSettleData(SettleVO vo);
	
	// 날짜 정산 날짜 데이터 가져오기
	public List<SettleVO> getDateData(SettleVO vo);
	// 날짜 매출일자 데이터 가져오기
	public List<SettleVO> getSettleData(SettleVO vo);
	
	// 매출일자 합계 구하기
	public List<SettleVO> totalOrder(SettleVO vo);
	
	// 정산일자 합계 구하기
	public List<SettleVO> totalSettle(SettleVO vo);
	
	
	
	
	
	// 조회기준 날짜 기준일때 매출일자 토탈 레코드   + 엑셀 다운위한 데이터 전체 불러오기용
	public List<SettleVO> getDateDataTotalRecord(SettleVO vo);
	
	// 조회기준 날짜 기준일때 정산날짜 토탈 레코드   + 엑셀 다운위한 데이터 전체 불러오기용
	public List<SettleVO> getSettleDataTotalRecord(SettleVO vo);
	
	
	// 엑셀 다운위한 데이터 전체 불러오기
	public List<SettleVO> excelOrderDateData(SettleVO vo);
	
	// 엑셀 다운위한 데이터 전체 불러오기
	public List<SettleVO> excelOrderSettleData(SettleVO vo);
}
