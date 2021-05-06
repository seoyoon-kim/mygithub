package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SettleVO;

public interface SettleDAO {
	// 날짜 데이터 가져오기
	public List<SettleVO> getDateData(SettleVO vo);
	// 정산금액 합계 가져오기
	public List<SettleVO> totalSettle(SettleVO vo);
}
