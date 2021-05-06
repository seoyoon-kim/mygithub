package com.beetmall.sshj.seller.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SettleService;
import com.beetmall.sshj.seller.vo.SettleVO;

@Controller
public class SettleController {
	
	@Autowired
	SettleService service;
	
	@RequestMapping("/settle")
	public String settlement() {
		return "seller/settlement_management";
	}
	
	@RequestMapping(value = "/sellerDateSearchingData",method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Object> searchingData(HttpServletRequest req) {
		SettleVO vo = new SettleVO();
		// 기본 설정
		vo.setStartDate(req.getParameter("startDate"));
		vo.setEndDate(req.getParameter("endDate"));
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		System.out.println(vo.getStartDate());
		System.out.println(vo.getEndDate());
		System.out.println(vo.getUserid());
		System.out.println(vo.getOnePageNum());
		System.out.println(vo.getPageNum());
		System.out.println(vo.getOnePageRecord());
		System.out.println(vo.getLastPageRecord());
		
		// 정산 금액 총 합계 가져오기
		List<SettleVO> totalSettle = service.totalSettle(vo); // totalMoney, totalRecord
		
		ArrayList<Object> sendData = new ArrayList<Object>();
		
		
		long result = 0;
		if(totalSettle.size() !=0) { // 값이 1이상 있으면 실행된다.
			SettleVO vo2 = totalSettle.get(0);
			sendData.add(0,vo2);// totalMoney, totalRecord
		} else {
			sendData.add(0, 0);
		}
		
		vo.setTotalMoney(result);
		List<SettleVO> lst = service.getDateData(vo);
		
		// 데이터 가져오기
		for(int i = 0; i < lst.size(); i++) {
			SettleVO vo2 = lst.get(i);
			System.out.println(vo2.getOrderdate());
		}
		sendData.add(1, service.getDateData(vo));

		return sendData;
	}
	

}
