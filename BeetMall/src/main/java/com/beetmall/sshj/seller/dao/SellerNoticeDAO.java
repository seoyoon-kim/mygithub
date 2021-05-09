package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerNoticeVO;

public interface SellerNoticeDAO {
	//공지사항 목록
	public List<SellerNoticeVO> sellerNoticeAllRecord(SearchAndPageVO spvo);
	//목록 선택 (공지사항 보기)
	public SellerNoticeVO sellerNoticeSelect(int infonum);
	//조회수
	public int countInfoHit(int infonum);
	//이전글 다음글
	public SearchAndPageVO lagLeadSelect(int infonum);
}
