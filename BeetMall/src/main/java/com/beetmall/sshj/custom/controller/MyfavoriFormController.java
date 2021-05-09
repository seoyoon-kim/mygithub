package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CategoryService;
import com.beetmall.sshj.custom.service.MyfavoriFormService;

@Controller
public class MyfavoriFormController {
	@Inject
	MyfavoriFormService myfavoriFormservies;
	
	@RequestMapping("myfavoriForm")
	public ModelAndView myfavoriForm(String logId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", myfavoriFormservies.myfavoriFormTotal());
		mav.addObject("list", myfavoriFormservies.myfavoriForm(logId));
		mav.setViewName("mypages/myfavoriForm");
		
		return mav;
	}
//	@RequestMapping("myfavoriForm")
//	public String myfavoriForm() {
//		return "mypages/myfavoriForm";
//	}
}
