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
	public ModelAndView myPoint(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		String pageNumStr = req.getParameter("pageNum");
		
		PointPageVO pageVO = new PointPageVO();
		pageVO.setUserid(userid);
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		} 
		String temp = "", type="";
		int month=0;
		// 타입 구분
		if((String)req.getParameter("type")!=null) {
			temp = (String)req.getParameter("type");
			if(temp.equals("save")) {
				type = ">=";
			}else if(temp.equals("spend")) {
				type = "<";
			}
		}
		// 월 선택 구분
		if((req.getParameter("month") != null)){
			month = Integer.parseInt(req.getParameter("month"));
		}
		/////////////////////////////////////////////////////
		if(type != null && !type.equals("") && month>0) {
			pageVO.setTotalRecord(pointservice.countPointTypeMonth(userid, type, month));
			pageVO.setType(type);
			pageVO.setMonth(month);
			mav.addObject("list", pointservice.selectPointTypeMonth(pageVO));
		}else if(type !=null && !type.equals("")) {
			pageVO.setTotalRecord(pointservice.countPointType(userid, type));
			pageVO.setType(type);
			mav.addObject("list", pointservice.selectPointTypeMonth(pageVO));
		}else if(month>0){
			pageVO.setTotalRecord(pointservice.countPointMonth(userid, month));
			pageVO.setMonth(month);
			mav.addObject("list", pointservice.selectPointTypeMonth(pageVO));
		}else {
			pageVO.setTotalRecord(pointservice.countPoint(userid));
			mav.addObject("list", pointservice.selectPointTypeMonth(pageVO));
		}
		////////////////////////////////////////////////////
		
		mav.addObject("pageVO", pageVO);
		mav.addObject("mypoint", pointservice.myPointView(userid));
		mav.addObject("type",temp);
		mav.addObject("month",month);
		mav.setViewName("mypages/mypoint");
		
		return mav;
	}
	
}
