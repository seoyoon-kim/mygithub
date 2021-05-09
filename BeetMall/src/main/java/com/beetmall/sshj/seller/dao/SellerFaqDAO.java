package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerFaqVO;


public interface SellerFaqDAO {

	//자주묻는질문 목록
	public List<SellerFaqVO> sellerfaqAllRecord(SearchAndPageVO spvo);
	//총 레코드 수 구하기
	public int totalRecord(SearchAndPageVO spvo);
}
