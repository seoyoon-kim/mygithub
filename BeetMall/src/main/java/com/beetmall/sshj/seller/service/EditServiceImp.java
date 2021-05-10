package com.beetmall.sshj.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.EditDAO;
import com.beetmall.sshj.seller.vo.EditVO;

@Service
public class EditServiceImp implements EditService {
	@Autowired
	EditDAO dao;

	@Override
	public EditVO selectInfo(String userid) {
		// TODO Auto-generated method stub
		return dao.selectInfo(userid);
	}

	@Override
	public int selectFavorite(String userid) {
		// TODO Auto-generated method stub
		return dao.selectFavorite(userid);
	}



	
}
