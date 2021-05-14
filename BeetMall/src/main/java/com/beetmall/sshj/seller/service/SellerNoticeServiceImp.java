package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerNoticeDAO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerNoticeVO;
@Service
public class SellerNoticeServiceImp implements SellerNoticeService {
	@Inject
	SellerNoticeDAO sellerNoticeDAO;
	@Override
	public List<SellerNoticeVO> sellerNoticeAllRecord(SearchAndPageVO sapvo) {
		return sellerNoticeDAO.sellerNoticeAllRecord(sapvo);
	}
	@Override
	public SellerNoticeVO sellerNoticeSelect(int infonum) {
		return sellerNoticeDAO.sellerNoticeSelect(infonum);
	}
	@Override
	public int countInfoHit(int infonum) {
		return sellerNoticeDAO.countInfoHit(infonum);
	}
	@Override
	public SearchAndPageVO lagLeadSelect(int infonum) {
		return sellerNoticeDAO.lagLeadSelect(infonum);
	}
	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		return sellerNoticeDAO.totalRecord(sapvo);
	}

}
