package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.IntroDAO;
import com.beetmall.sshj.seller.vo.IntroVO;

@Service
public class IntroServiceImp implements IntroService {
	@Autowired
	IntroDAO dao;

	@Override
	public IntroVO selectInfo(String userid) {
		return dao.selectInfo(userid);
	}

	@Override
	public int selectFavorite(String userid) {
		return dao.selectFavorite(userid);
	}
	
	
}
