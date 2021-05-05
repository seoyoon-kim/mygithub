package com.beetmall.sshj.seller.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void searchingData(HttpServletRequest req, Model model) {
		SettleVO vo = new SettleVO();
		vo.setStartDate(req.getParameter("startDate"));
		vo.setEndDate(req.getParameter("endDate"));
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		
		model.addAttribute("dateData",service.getDateData(vo));
		
	}
}
