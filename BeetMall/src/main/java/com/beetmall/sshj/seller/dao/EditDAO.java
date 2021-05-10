package com.beetmall.sshj.seller.dao;

import com.beetmall.sshj.seller.vo.EditVO;

public interface EditDAO {
	//Edit 접속시 판매자 데이터 가져오기
	public EditVO selectInfo(String userid);
	//Edit 접속시 즐겨찾기 수 가져오기
	public int selectFavorite(String userid);
}
