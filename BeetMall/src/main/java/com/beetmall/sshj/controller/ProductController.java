package com.beetmall.sshj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("/product_list")
	public String product_list() {
		return "seller/product_list";
	}
	@RequestMapping("/order_management")
	public String order_management() {
		return "seller/order_management";
	}
}