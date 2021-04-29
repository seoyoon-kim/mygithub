package com.beetmall.sshj.custom.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beetmall.sshj.custom.service.UserInfoService;
import com.beetmall.sshj.custom.vo.UserInfoVO;


@Controller
public class UserInfoController {
	@Inject
	UserInfoService userInfoService;
	
	@RequestMapping("/infobusiz")
	@ResponseBody
	public List<UserInfoVO> infobusiz(){
		return userInfoService.infobusiz();
	}
	@RequestMapping("/infomaition")
	@ResponseBody
	public List<UserInfoVO> infomaition(){
		return userInfoService.infomaition();
	}
	@RequestMapping("/personaal")
	@ResponseBody
	public List<UserInfoVO> personaal(){
		return userInfoService.personaal();
	}
	
}
