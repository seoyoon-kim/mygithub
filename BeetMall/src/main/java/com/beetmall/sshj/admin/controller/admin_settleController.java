package com.beetmall.sshj.admin.controller;

import javax.inject.Inject; 
 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_BoardService; 
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO; 

@Controller
public class admin_settleController {
	@Inject
	Admin_BoardService adminService;
	 
	
	@RequestMapping("/settleMng")
	public ModelAndView settleMng() {
		ModelAndView mav = new ModelAndView();
		Admin_Board_PageVO pageVO = new Admin_Board_PageVO();
		mav.addObject("list", adminService.noticeBoardList(pageVO));
		mav.setViewName("/admin/settleMng");
		return mav;
	}
	 
	
	
	 
}