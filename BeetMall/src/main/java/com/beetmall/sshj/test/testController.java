package com.beetmall.sshj.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	
	@RequestMapping("/kangsan")
	public String kangsan() {
		return "custom/categoryMain";
	}
	
	@RequestMapping("/kcenter")
	public String kcenter() {
		return "custom/noticeMain";
	}
	@RequestMapping("/noticeMain")
	public String kcenter2() {
		return "custom/noticeMain";
	}
	
	@RequestMapping("/customerCenter")
	public String customerCenter() {
		return "custom/customerCenter";
	}
	
	@RequestMapping("/FAQBoard")
	public String FAQBoard() {
		return "custom/FAQBoard";
	}
	
	@RequestMapping("/customerCenterWrite")
	public String customerCenterWrite() {
		return "custom/customerCenterWrite";
	}
	
	@RequestMapping("/mapping")
	public String mapping() {
		return "custom/mapList";
	}
	
	@RequestMapping("/kangsan2")
	public String kangsan2() {
		return "custom/uglyItem";
	}
	
	@RequestMapping("kangsan3")
	public String kangsan3() {
		return "custom/categoryCharge";
	}
	
	@RequestMapping("kangsan4")
	public String kangsan4() {
		return "custom/payCategory";
	}
	
	@RequestMapping("myfavoriForm")
	public String myfavoriForm() {
		return "mypages/myfavoriForm";
	}
}
