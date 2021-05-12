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
	public ModelAndView myPoint(HttpSession session, HttpServletRequest req) {	// 마이포인트
		ModelAndView mav = new ModelAndView();		
		String userid = (String)session.getAttribute("logId");
		String type = null; 
		int month=0;
		// 페이지 설정
		String pageNumStr = req.getParameter("pageNum");
		PointPageVO vo = new PointPageVO();
		if(pageNumStr != null) {
			vo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		// afsad
		int pageView = vo.getPageNum() * vo.getOnePageRecord();
		int lastPage = 0;
		if(vo.getPageNum() == vo.getTotalPage()) {	// 마지막페이지
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
			System.out.println("1번째로 지나감");
			mav.addObject("list", pointservice.selectPointTypeMonth(userid, tag, month));
//			vo.setTotalRecord(pointservice.countPointTypeMonth(userid, type, month));
		}else if(type !=null && !type.equals("")) {
			System.out.println("2번째로 지나감");
			mav.addObject("list", pointservice.selectPointType(userid, tag));
		}else if(month>0){
			System.out.println("3번째로 지나감");
			mav.addObject("list", pointservice.selectPointMonth(userid, month));
		}else {
			System.out.println("4번째로 지나감");
			System.out.println("pageView = "+pageView+" lastPage = "+lastPage);
			mav.addObject("list", pointservice.selectPoint(userid, pageView, lastPage));
		}
		mav.addObject("type",type);
		mav.addObject("month",month);
		System.out.println("getLastPageRecord  = "+vo.getLastPageRecord());
		System.out.println("getOnePageNum  = "+vo.getOnePageNum());
		System.out.println("getOnePageRecord  = "+vo.getOnePageRecord());
		System.out.println("getPageNum  = "+vo.getPageNum());
		System.out.println("getStartPageNum  = "+vo.getStartPageNum());
		System.out.println("getTotalPage  = "+vo.getTotalPage());
		System.out.println("getTotalRecord  = "+vo.getTotalRecord());
		mav.addObject("pageVO",vo);
		mav.setViewName("mypages/mypoint");
		
		return mav;
	}
	
}
