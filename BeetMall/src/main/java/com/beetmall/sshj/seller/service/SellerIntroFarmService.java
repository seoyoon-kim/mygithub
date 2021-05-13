package com.beetmall.sshj.seller.service;

import com.beetmall.sshj.seller.vo.SellerIntroFarmVO;

public interface SellerIntroFarmService {
	//intro 접속시 판매자 데이터 가져오기
	public SellerIntroFarmVO selectInfo(String userid);
	//intro 접속시 즐겨찾기 수 가져오기
	public int selectFavorite(String userid);
}
