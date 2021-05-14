package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerFaqVO;

public interface SellerFaqService {
	
	//자주묻는질문 전체보기
	public List<SellerFaqVO> sellerfaqAllRecord(SearchAndPageVO sapvo);
	//총 레코드 수 구하기 
	public int totalRecord(SearchAndPageVO sapvo);
}
