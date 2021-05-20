package com.beetmall.sshj.seller.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.seller.dao.OrderDAO;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Service
public class OrderServiceImp implements OrderService {
	@Inject
	OrderDAO orderDAO;

	@Override
	public List<OrderSaleVO> orderList(SearchAndPageVO sapvo) {
		return orderDAO.orderList(sapvo);
	}

	@Override
	public int totalRecord(SearchAndPageVO sapvo) {
		return orderDAO.totalRecord(sapvo);
	}

	@Override
	public List<OrderSaleVO> oneRecordSelect(String ordernum) {
		return orderDAO.oneRecordSelect(ordernum);
	}

	@Override
	public int orderStatusUpdate(String ordernum, String orderstatus) {
		return orderDAO.orderStatusUpdate(ordernum, orderstatus);
	}
}