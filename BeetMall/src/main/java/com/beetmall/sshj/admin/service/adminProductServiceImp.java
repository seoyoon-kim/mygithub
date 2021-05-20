package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.adminProductDAO;
import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Service
public class adminProductServiceImp implements adminProductService {
	
	@Inject
	adminProductDAO productDAO;

	@Override
	public List<adminProductVO> productList(adminkPageSearchVO pageVO) {
		return productDAO.productList(pageVO);
	}

	@Override
	public int productOnetotalRecord(adminkPageSearchVO pageVO) {
		return productDAO.productOnetotalRecord(pageVO);
	}
	
}
