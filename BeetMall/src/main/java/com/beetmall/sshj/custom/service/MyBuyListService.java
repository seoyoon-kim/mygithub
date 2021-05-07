package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyBuyListVO;

public interface MyBuyListService {

	public List<MyBuyListVO> selectBuyList(String userid);
	public int orderCommit(int ordernum);
	public int orderCancel(int ordernum);
	public int orderCancelOk(int ordernum);
	public int reviewCheck(int ordernum);
	public MyBuyListVO selectBuyList(int productnum);
}
