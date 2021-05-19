package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.ClaimVO;
import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.PointPageVO;
import com.beetmall.sshj.custom.vo.ReviewVO;
import com.beetmall.sshj.custom.vo.UserQBoardVO;

public interface MyBuyListService {

	public List<MyBuyListVO> selectBuyList(PointPageVO vo);
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
	public ClaimVO returnSelect(int ordernum);
	public int qboardInsert(UserQBoardVO vo);
	public int returnFinish(int ordernum);
	public List<MyBuyListVO> monthSelectBuyList(String userid, int month);
	public int returnPageRecord(String userid);
	public int returnPageRecordMonth(String userid, int month);
}
