package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView myfavoriForm(String logId, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String logId1 = (String)req.getSession().getAttribute("logId");
		System.out.println("logId1 = " + logId1);
		
		mav.addObject("list", myfavoriFormservies.myfavoriForm(logId1));
		mav.setViewName("mypages/myfavoriForm");
		
		return mav;
	}
//	@RequestMapping("myfavoriForm")
//	public String myfavoriForm() {
//		return "mypages/myfavoriForm";
//	}
}
