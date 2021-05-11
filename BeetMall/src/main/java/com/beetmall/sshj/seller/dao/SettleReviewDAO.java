package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SettleReviewVO;

public interface SettleReviewDAO {
	public List<SettleReviewVO> breakdown(String userid);

	
}
