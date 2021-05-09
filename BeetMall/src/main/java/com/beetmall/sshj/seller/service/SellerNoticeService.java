package com.beetmall.sshj.seller.service;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerNoticeVO;

public interface SellerNoticeService{
//공지사항 목록
	public List<SellerNoticeVO> sellerNoticeAllRecord(SearchAndPageVO spvo);
//목록 선택 (공지사항 보기)
	public SellerNoticeVO sellerNoticeSelect(int infonum);
//조회수
	public int countInfoHit(int infonum);
//이전글 다음글
	public SearchAndPageVO lagLeadSelect(int infonum);
//총 레코드 수 구하기
	public int totalRecord(SearchAndPageVO spvo);
}
