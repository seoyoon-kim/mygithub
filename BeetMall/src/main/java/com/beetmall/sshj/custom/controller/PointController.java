package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.PointService;
import com.beetmall.sshj.custom.vo.PointPageVO;

@Controller
public class PointController {
	@Inject
	PointService pointservice;
	
	@RequestMapping("mypoint")
	public ModelAndView myPoint(HttpSession session, HttpServletRequest req, PointPageVO vo) {	// 마이포인트
		ModelAndView mav = new ModelAndView();		
		String userid = (String)session.getAttribute("logId");
		String type = null; 
		int month=0;
		
		// 페이지 설정
		int pageView = vo.getPageNum()*vo.getOnePageRecord();
		int lastPage; 
		if(vo.getPageNum() == vo.getTotalPage()) {
			lastPage = vo.getLastPageRecord();
		}else {
			lastPage = vo.getOnePageRecord();
		}
		
		
		String tag = "";
		// 타입 구분
		if((String)req.getParameter("type")!=null) {
			type = (String)req.getParameter("type");
			if(type.equals("save")) {
				tag = ">=";
			}else if(type.equals("spend")) {
				tag = "<";
			}
		}
		// 월 선택 구분
		if((req.getParameter("month") != null)){
			month = Integer.parseInt(req.getParameter("month"));
		}
		// 타입 + 월 있는지 유무로 구분하는 부분
		if(type != null && !type.equals("") && month>0) {
			mav.addObject("list", pointservice.selectPointTypeMonth(userid, tag, month));
		}else if(type !=null && !type.equals("")) {
			mav.addObject("list", pointservice.selectPointType(userid, tag));
		}else if(month>0){
			mav.addObject("list", pointservice.selectPointMonth(userid, month));
		}else {
			mav.addObject("list", pointservice.selectPoint(userid, pageView, lastPage));
		}
		mav.addObject("type",type);
		mav.addObject("month",month);
		mav.addObject("pagelist",vo);
		mav.setViewName("mypages/mypoint");
		
		return mav;
	}
	
}
