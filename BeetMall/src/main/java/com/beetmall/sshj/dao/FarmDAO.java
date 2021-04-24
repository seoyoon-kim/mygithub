package com.beetmall.sshj.dao;

import java.util.List;

import com.beetmall.sshj.vo.FarmVO;

public interface FarmDAO {
	// 카테고리 리스트 불러오기
	public List<FarmVO> allCategoryList();
	// 매출분석 데이터 리스트
	public List<FarmVO> salesDataList(FarmVO vo);
}
