package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.ReviewVO;

public interface MyBuyListDAO {
	public List<MyBuyListVO> selectBuyList(String userid);
	public int orderCommit(int ordernum);
	public int orderCancel(int ordernum);
	public int orderCancelOk(int ordernum);
	public int reviewCheck(int ordernum);
	public MyBuyListVO selectReviewProduct(int productnum);
	public int reviewWrite(ReviewVO vo);
}
