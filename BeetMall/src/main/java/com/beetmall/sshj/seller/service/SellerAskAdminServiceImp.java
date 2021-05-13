package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerAskAdminDAO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerAskAdminVO;
@Service
public class SellerAskAdminServiceImp implements SellerAskAdminService {
	 @Inject 
	 SellerAskAdminDAO sellerAskAdminDAO;
	
	@Override
	public List<SellerAskAdminVO> askAllRecord(String userid) {
		return sellerAskAdminDAO.askAllRecord(userid);
	}
	
	@Override
	public int askWrite(SellerAskAdminVO saavo) {
		return sellerAskAdminDAO.askWrite(saavo);
	}
	
	@Override
	public SellerAskAdminVO askSelect(String userid, int qnum) {
		return sellerAskAdminDAO.askSelect(userid, qnum);
	}
	
	@Override
	public int askDelete(int qnum) {
		return sellerAskAdminDAO.askDelete(qnum);
	}
	
	@Override
	public int askEditOk(SellerAskAdminVO saavo) {
		return sellerAskAdminDAO.askEditOk(saavo);
	}
	
	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		return sellerAskAdminDAO.totalRecord(sapvo);
	}

}
