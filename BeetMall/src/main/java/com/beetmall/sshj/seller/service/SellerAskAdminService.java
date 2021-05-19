package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerAskAdminVO;

public interface SellerAskAdminService {
	//내가 쓴 문의하기 글 목록
	public List<SellerAskAdminVO> askAllRecord(String userid);
	//문의하기 
	public int askWrite(SellerAskAdminVO saavo); 
	//문의한 글보기
	public SellerAskAdminVO askSelect(String userid, int qnum);
	//삭제하기
	public int askDelete(int qnum);
	//수정하기
	public int askEditOk(SellerAskAdminVO saavo);
	//총 레코드 수 구하기
	public int totalRecord(SearchAndPageVO sapvo);
	//서머노트 이미지 업로드
	
}
