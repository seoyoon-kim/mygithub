package com.beetmall.sshj.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@RequestMapping("/seller_review")
	public String seller_review() {
		return "seller/seller_review";
	}
}
