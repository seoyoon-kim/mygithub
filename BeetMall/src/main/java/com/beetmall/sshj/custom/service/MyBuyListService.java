package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.ClaimVO;
import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.ReviewVO;

public interface MyBuyListService {

	public List<MyBuyListVO> selectBuyList(String userid);
	public int orderCommit(int ordernum);
	public int orderCancel(int ordernum);
	public int orderCancelOk(int ordernum);
	public int reviewCheck(int ordernum);
	public MyBuyListVO selectReviewProduct(int productnum);
	public int reviewWrite(ReviewVO vo);
	public ReviewVO reviewSelect(int ordernum);
	public int reviewgoodCount(int reviewnum);
	public int reviewcheck(int reviewnum, String userid);
	public int reviewGoodCancel(int reviewnum, String userid);
	public int reviewGood(int reviewnum, String userid);
	public int claimInsert(ClaimVO vo);
	public int claimUpdate(int ordernum, String status);
}
