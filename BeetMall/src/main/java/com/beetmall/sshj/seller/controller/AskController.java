package com.beetmall.sshj.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AskController {
	
	@RequestMapping("/askManage")
	public String settlement() {
		return "seller/ask_management";
	}
}
