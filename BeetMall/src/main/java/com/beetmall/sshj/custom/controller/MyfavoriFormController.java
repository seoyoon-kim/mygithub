package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MyfavoriFormService;

@Controller
public class MyfavoriFormController {
	@Inject
	MyfavoriFormService myfavoriFormservies;
	
	@RequestMapping("myfavoriForm")
	public ModelAndView myfavoriForm(String logId, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String logId1 = (String)req.getSession().getAttribute("logId");
		
		mav.addObject("list", myfavoriFormservies.myfavoriForm(logId1));
		mav.setViewName("mypages/myfavoriForm");
		
		return mav;
	}
//	@RequestMapping("myfavoriForm")
//	public String myfavoriForm() {
//		return "mypages/myfavoriForm";
//	}
	@RequestMapping("customFarm")
	public ModelAndView customFarm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int storenum=Integer.parseInt(req.getParameter("storenum"));
		
		//조회수증가
		myfavoriFormservies.farmHit(storenum);
		
		mav.addObject("result", myfavoriFormservies.selectInfo2(storenum)); // 전체 데이터 불러오기
		mav.addObject("favorite", myfavoriFormservies.selectFavorite2(storenum)); // 즐겨찾기 수 불러오기
		mav.setViewName("mypages/customFarm");
		return mav;
	}
	
}
