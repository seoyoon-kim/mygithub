package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.MyBuyListDAO;
import com.beetmall.sshj.custom.vo.MyBuyListVO;

@Service
public class MyBuyListServiceImp implements MyBuyListService {
	@Inject
	MyBuyListDAO mybuylistDAO;

	@Override
	public List<MyBuyListVO> selectBuyList(String userid) {
		
		return mybuylistDAO.selectBuyList(userid);
	}

	@Override
	public int orderCommit(int ordernum) {
		
		return mybuylistDAO.orderCommit(ordernum);
	}

	@Override
	public int orderCancel(int ordernum) {
		return mybuylistDAO.orderCancel(ordernum);
	}

	@Override
	public int orderCancelOk(int ordernum) {
		
		return mybuylistDAO.orderCancelOk(ordernum);
	}

	@Override
	public int reviewCheck(int ordernum) {
		
		return mybuylistDAO.reviewCheck(ordernum);
	}

	@Override
	public MyBuyListVO selectBuyList(int productnum) {
		
		return mybuylistDAO.selectBuyList(productnum);
	}

	

}
