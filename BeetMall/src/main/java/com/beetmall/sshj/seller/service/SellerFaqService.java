package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerFaqVO;

public interface SellerFaqService {
	
	//자주묻는질문 전체보기
	public List<SellerFaqVO> sellerfaqAllRecord(SearchAndPageVO spvo);
}
