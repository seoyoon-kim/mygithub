package com.beetmall.sshj.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<SettleVO> searchingData(HttpServletRequest req) {
		SettleVO vo = new SettleVO();
		vo.setStartDate(req.getParameter("startDate"));
		vo.setEndDate(req.getParameter("endDate"));
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		return service.getDateData(vo);		
	}
}
