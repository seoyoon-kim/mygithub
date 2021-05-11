package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SettleReviewVO;

public interface SettleReviewService {
	public List<SettleReviewVO> breakdown(String userid);
}
