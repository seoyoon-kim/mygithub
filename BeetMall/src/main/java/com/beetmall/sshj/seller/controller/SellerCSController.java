package com.beetmall.sshj.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerCSController {

	@RequestMapping("/notice")
	public String notice() {
		return "seller/notice";
	}
	@RequestMapping("/notice_view")
	public String noticeView() {
		return "seller/notice_view";
	}	
	@RequestMapping("/ask_admin_list")
	public String ask_admin_list() {
		return "seller/ask_admin_list";
	}
	@RequestMapping("/ask_admin_view")
	public String ask_admin_view() {
		return "seller/ask_admin_view";
	}
	@RequestMapping("/ask_admin_write")
	public String ask_admin_write() {
		return "seller/ask_admin_write";
	}
	@RequestMapping("/ask_admin_edit")
	public String ask_admin_edit() {
		return "seller/ask_admin_edit";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "seller/faq";
	}
}

