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
	public List<SellerFaqVO> sellerfaqAllRecord(SearchAndPageVO spvo) {
		return sellerFaqDAO.sellerfaqAllRecord(spvo);
	}

	@Override
	public int totalRecord(SearchAndPageVO spvo) {
		return sellerFaqDAO.totalRecord(spvo);
	}

}
