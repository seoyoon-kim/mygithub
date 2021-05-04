package com.beetmall.sshj.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettleController {
	
	@RequestMapping("/settle")
	public String settlement() {
		return "seller/settlement_management";
	}
}
