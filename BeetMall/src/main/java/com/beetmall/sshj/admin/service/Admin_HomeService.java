package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_HomeVO;

public interface Admin_HomeService {
	// 배송, 클레임
	public List<Admin_HomeVO> getDeliveryClaim();
	// 주문, 매출
	public Admin_HomeVO getOrderSales();
	// 공지사항
	public List<Admin_HomeVO> getNotice();
	// 문의
	public Admin_HomeVO getQuestion();
	// 판매자 승인 요청
	public Admin_HomeVO getApprove();
	// 판매자 승인 완료
	public Admin_HomeVO getApproveClear();
	// 새로운 신고
	public Admin_HomeVO getNewReport();
	// 미처리 신고
	public Admin_HomeVO getWaitingReport();
	// 매출통계 3개월치
	public List<Admin_HomeVO> getSalesData(int num);
}
