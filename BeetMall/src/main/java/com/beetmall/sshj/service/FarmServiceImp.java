package com.beetmall.sshj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.dao.FarmDAO;
import com.beetmall.sshj.vo.FarmVO;

@Service
public class FarmServiceImp implements FarmService {

	@Autowired
	FarmDAO dao;
	
	@Override
	public List<FarmVO> allCategoryList() {
		return dao.allCategoryList();
	}

}
