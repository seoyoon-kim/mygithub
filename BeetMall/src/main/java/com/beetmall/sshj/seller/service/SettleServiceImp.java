package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SettleDAO;
import com.beetmall.sshj.seller.vo.SettleVO;

@Service
public class SettleServiceImp implements SettleService{
	@Autowired
	SettleDAO dao;
	
	@Override
	public List<SettleVO> getDateData(SettleVO vo) {
		return dao.getDateData(vo);
	}

	@Override
	public List<SettleVO> totalSettle(SettleVO vo) {
		return dao.totalSettle(vo);
	}
	
	
	
}
