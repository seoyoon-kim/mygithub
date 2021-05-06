package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.FarmVO;

public interface FarmService {
	// 카테고리 리스트 불러오기
	public List<FarmVO> allCategoryList();
	// 매출분석 데이터 리스트
	public List<FarmVO> salesDataList(FarmVO vo);
}
