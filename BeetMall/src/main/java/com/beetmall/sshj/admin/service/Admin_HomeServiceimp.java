package com.beetmall.sshj.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_HomeDAO;
import com.beetmall.sshj.admin.vo.Admin_HomeVO;
@Service
public class Admin_HomeServiceimp implements Admin_HomeService{

	@Autowired
	Admin_HomeDAO dao;
	
	@Override
	public List<Admin_HomeVO> getDeliveryClaim() {
		// TODO Auto-generated method stub
		return dao.getDeliveryClaim();
	}

	@Override
	public Admin_HomeVO getOrderSales() {
		// TODO Auto-generated method stub
		return dao.getOrderSales();
	}

	@Override
	public List<Admin_HomeVO> getNotice() {
		// TODO Auto-generated method stub
		return dao.getNotice();
	}

	@Override
	public Admin_HomeVO getQuestion() {
		// TODO Auto-generated method stub
		return dao.getQuestion();
	}

	@Override
	public Admin_HomeVO getApprove() {
		// TODO Auto-generated method stub
		return dao.getApprove();
	}

	@Override
	public Admin_HomeVO getApproveClear() {
		// TODO Auto-generated method stub
		return dao.getApproveClear();
	}

	@Override
	public Admin_HomeVO getNewReport() {
		// TODO Auto-generated method stub
		return dao.getNewReport();
	}

	@Override
	public Admin_HomeVO getWaitingReport() {
		// TODO Auto-generated method stub
		return dao.getWaitingReport();
	}

}
