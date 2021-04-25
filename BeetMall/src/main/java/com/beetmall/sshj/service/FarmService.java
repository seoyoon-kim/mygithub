package com.beetmall.sshj.service;

import java.util.List;

import com.beetmall.sshj.vo.FarmVO;

public interface FarmService {
	// 카테고리 리스트 불러오기
	public List<FarmVO> allCategoryList();
	
}
