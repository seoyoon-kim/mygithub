package com.beetmall.sshj.seller.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerMainService;
import com.beetmall.sshj.seller.vo.SellerMainVO;

@Controller
public class SellerMainController {

	@Autowired
	SellerMainService service;
	
	@RequestMapping("/sellerMain")
	public ModelAndView sellerMainPage(HttpSession session, SellerMainVO vo) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("logId");
		if(userid!=null) {
			vo.setUserid(userid);
			DecimalFormat formatter = new DecimalFormat("###,###");
			int realpayment = 0;
			int newOrder = 0;
			
			List<SellerMainVO> todayInfo = service.getOrderSales(vo);
			if(todayInfo.size() != 0) {
				for(int i =0; i < todayInfo.size(); i++) {
					newOrder = todayInfo.get(0).getNewOrder();
					realpayment = todayInfo.get(i).getRealpayment();
				}
			}
			
			List<SellerMainVO> status = service.getDeliveryStatus(vo);
			if(status.size() != 0) {
				for(int i =0; i< status.size(); i++) {
					if(status.get(i).getOrderstatus().equals("배송준비중")) {
						mav.addObject("ready", status.get(i).getOrdercount());
					} else if(status.get(i).getOrderstatus().equals("배송중")) {
						mav.addObject("ing", status.get(i).getOrdercount());
					} else if(status.get(i).getOrderstatus().equals("환불")) {
						mav.addObject("refund", status.get(i).getOrdercount());
					} else if(status.get(i).getOrderstatus().equals("취소")) {
						mav.addObject("cancel", status.get(i).getOrdercount());
					}
				}
			}
			
			mav.addObject("todayMoney", formatter.format(realpayment));
			mav.addObject("newOrder", newOrder); 
			mav.addObject("order", service.getOrderSales(vo));
			mav.addObject("notice", service.getNotice(vo));
			mav.addObject("review", service.getReview(vo));
			mav.addObject("qboard", service.getQboard(vo));
			
			int num[] = {2,1,0};
			
			for (int j=0; j<num.length; j++) {
				List<SellerMainVO> result = service.getPayData(num[j], userid);
				int resultSum = 0;
				if(result.size() != 0) {
					for(int i =0; i < result.size(); i++) {
						resultSum += result.get(i).getPayData();
					}
					
					String resultStr = formatter.format(resultSum);
					String resultDate = result.get(j).getMonthData()+"월";
					mav.addObject("resultStr"+j,resultSum);
					mav.addObject("resultDate"+j,resultDate);
					System.out.println(resultSum);
					System.out.println(resultDate);
				}
			}
		
			mav.setViewName("seller/sellerMainPage");
		} else {
			mav.setViewName("home");
		}
		
		return mav;
	}
}
