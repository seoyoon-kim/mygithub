package com.beetmall.sshj.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_SalesDAO;
import com.beetmall.sshj.admin.vo.Admin_SalesVO;

@Service
public class Admin_SalesServiceImp implements Admin_SalesService{

	@Autowired
	Admin_SalesDAO dao;
	
	@Override
	public Admin_SalesVO getCompaySellerCustomerData(Admin_SalesVO vo) {
		// TODO Auto-generated method stub
		return dao.getCompaySellerCustomerData(vo);
	}
	
}
