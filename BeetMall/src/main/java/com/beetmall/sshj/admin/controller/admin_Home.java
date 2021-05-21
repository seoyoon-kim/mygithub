package com.beetmall.sshj.admin.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_HomeService; 
import com.beetmall.sshj.admin.vo.Admin_HomeVO;
import com.beetmall.sshj.admin.vo.BoardVO; 

@Controller
public class admin_Home { 
	@Autowired
	Admin_HomeService service;
	
	//////////////////////관리자 홈페이지///////////////////////////////////// 
	@RequestMapping("/adminHome")
	public ModelAndView noticeBoardList() {
		ModelAndView mav = new ModelAndView(); 
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		// 주문,매출
		Admin_HomeVO order = service.getOrderSales();
			//주문
			mav.addObject("ordercount",formatter.format(order.getOrdercount()));
			//매출
			mav.addObject("realpayment",formatter.format(order.getRealpayment()));
		
		
		// 배송, 클레임
		List<Admin_HomeVO> delivery = service.getDeliveryClaim();
		if( delivery != null && delivery.size() != 0 ) {
			for(int i = 0; i< delivery.size(); i++) {
				Admin_HomeVO status = delivery.get(i);
				if(delivery.get(i).getOrderstatus().equals("배송준비중")) {
					mav.addObject("ready", formatter.format(status.getOrdercount()));
				} else if(delivery.get(i).getOrderstatus().equals("배송중")) {
					mav.addObject("ing", formatter.format(status.getOrdercount()));
				} else if(delivery.get(i).getOrderstatus().equals("환불")) {
					mav.addObject("refund", formatter.format(status.getOrdercount()));
				} else if(delivery.get(i).getOrderstatus().equals("취소")) {
					mav.addObject("cancel", formatter.format(status.getOrdercount()));
				} else if(delivery.get(i).getOrderstatus().equals("배송완료")) {
					mav.addObject("deliveryClear", formatter.format(status.getOrdercount()));
				}
			}
		} else {
			mav.addObject("orderstatus",0);
		}
		
		
		// 공지사항
		mav.addObject("notice",service.getNotice());
		
		// 미답변 문의
		mav.addObject("question",service.getQuestion().getQmanswer());
		
		// 판매자 승인 신청
		mav.addObject("approve",service.getApprove().getWaiting());
		
		// 판매자 승인 완료
		mav.addObject("clear",service.getApproveClear().getRegiapproval());
		
		// 신고 접수
		mav.addObject("report",service.getNewReport().getReportOver());
		
		// 신고 미처리건수
		mav.addObject("waiting",service.getWaitingReport().getReportWaiting());
		
		// 매출 통계 3개월치
		int num[] = {2,1,0};
			
		for(int i = 0; i< num.length; i++) {
			List<Admin_HomeVO> result = service.getSalesData(num[i]);
			long resultSellerSum = 0;
			long resultAdminSum = 0;
			if(result.size() != 0) {
				for(int j=0; j<result.size();j++) {
					resultSellerSum += result.get(j).getSalesSellerSum();
					resultAdminSum += Math.round(result.get(j).getSalesAdminSum());
				}
				long resultSellerSales = resultSellerSum;
				long resultAdminSales = resultAdminSum;
				String resultDate = result.get(0).getSalesMonth() +"월";
				long resultTrend = result.get(0).getSalesTrend();
				mav.addObject("resultSeller"+i,resultSellerSales);
				mav.addObject("resultAdminSales"+i,resultAdminSales);
				mav.addObject("resultDate"+i,resultDate);
				mav.addObject("resultTrend"+i,resultTrend);
			} 
		}
		
		
		
		mav.setViewName("/admin/adminHome");
		return mav;
	}
	
}