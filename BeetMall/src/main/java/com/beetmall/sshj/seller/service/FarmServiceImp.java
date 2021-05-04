package com.beetmall.sshj.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.FarmDAO;
import com.beetmall.sshj.seller.vo.FarmVO;

@Service
public class FarmServiceImp implements FarmService {

	@Autowired
	FarmDAO dao;
	
	@Override
	public List<FarmVO> allCategoryList() {
		return dao.allCategoryList();
	}

	@Override
	public List<FarmVO> salesDataList(FarmVO vo) {
		return dao.salesDataList(vo);
	}

}
