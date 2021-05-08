package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.SellerFaqDAO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerFaqVO;

@Service
public class SellerFaqServiceImp implements SellerFaqService {
	@Inject
	SellerFaqDAO sellerFaqDAO;
	
	@Override
	public List<SellerFaqVO> sellerfaqAllRecord() {
		return sellerFaqDAO.sellerfaqAllRecord();
	}

	@Override
	public List<SellerFaqVO> searchList(SearchAndPageVO spvo) {
		return sellerFaqDAO.searchList(spvo);
	}

}
