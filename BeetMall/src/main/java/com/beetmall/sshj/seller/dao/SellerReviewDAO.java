package com.beetmall.sshj.seller.dao;

import java.util.List;

import com.beetmall.sshj.seller.vo.SellerReviewVO;

public interface SellerReviewDAO {
	// 토탈 데이터 알기위한 기능 
	public List<SellerReviewVO> breakdown(String userid);
	// 리뷰 리스트 rownum (paging용) 가져오기
	public List<SellerReviewVO> reviewlist(SellerReviewVO vo);
	// ajax 사용시 리스트 record 알기 위해서 사용
	public List<SellerReviewVO> reviewlistRecord(SellerReviewVO vo);
	// 리뷰 답변 업데이트
	public int answerUpdate(SellerReviewVO vo);
	// 리뷰 신고 업데이트
	public int reviewReportUpdate(SellerReviewVO vo);
	// 신고 테이블 업데이트
	public int reportInsert(SellerReviewVO vo);
	// 리뷰 답글 수정
	public int reviewAnswerUpdate(SellerReviewVO vo);
}
