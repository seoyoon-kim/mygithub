package com.beetmall.sshj.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession; 
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_MemberService;
import com.beetmall.sshj.admin.service.Admin_MemberServiceImp;
import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.BoardVO; 

@Controller
public class admin_customerController {
	@Inject
	Boardervice adminService;
	//////////////////////일반회원 관리////////////////////////////////
	@Inject
	Admin_MemberServiceImp memberservice;
	//목록보기
	@RequestMapping("/customerListA")
	public ModelAndView customerListA(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		int logType = 0;
		int selType = 0; // 일반회원
		pageVO.setUserType(0); // 일반회원만 조회할거라서 1;
		String pageNumStr = req.getParameter("pageNum");
		
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		
		//pageVO.setTotalRecord();
		if(session.getAttribute("logType")!=null) {
			logType = (int)session.getAttribute("logType");
		}else {
			logType = 0;
		}
		int re = memberservice.memberCountall(logType);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.memberselectall(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("/admin/customerListA");
		return mav;
	}
	//회원정보 수정
	@RequestMapping("/boardCustomerInfoEdit")
	public ModelAndView boardCustomerInfoEdit(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		String userid = req.getParameter("userid");
		System.out.println("조회하는 페이지의 유저아이디="+userid);
		mav.addObject("ilist",memberservice.memberinfoSelect(userid));
		
		mav.addObject("olist1", memberservice.orderstatusSelect(userid, "결제완료"));
		mav.addObject("olist2", memberservice.orderstatusSelect(userid, "구매확정"));
		mav.addObject("olist3", memberservice.orderstatusSelect(userid, "배송중"));
		mav.addObject("olist4", memberservice.orderstatusSelect(userid, "환불"));
		mav.addObject("olist5", memberservice.orderstatusSelect(userid, "환불 진행중"));
		mav.addObject("rlist",memberservice.reportinfoSelect(userid));
		mav.setViewName("/admin/boardCustomerInfoEdit");
		return mav;
	}
	//탈퇴회원보기
	@RequestMapping("/customerLeaveList")
	public ModelAndView customerLeaveList(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		int logType = 0;
		int selType = 4; // 탈퇴한 일반회원
		pageVO.setUserType(4); // 탈퇴한 일반회원만 조회할거라서 4;
		String pageNumStr = req.getParameter("pageNum");
		
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		
		//pageVO.setTotalRecord();
		if(session.getAttribute("logType")!=null) {
			logType = (int)session.getAttribute("logType");
		}else {
			logType = 0;
		}
		int re = memberservice.memberCount(logType,  selType);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.memberselect(pageVO));
		mav.addObject("pageVO", pageVO);
		mav.setViewName("/admin/customerLeaveList");
		return mav;
	}
	
	//블랙리스트 보기
	@RequestMapping("/customerBlackList")
	public ModelAndView customerBlackList(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
		int logType = 0;
		int selType = 1; // 정지된 구매자회원
		pageVO.setUserType(1); // 정지된 구매자회원만 조회할거라서 1;
		String pageNumStr = req.getParameter("pageNum");
		
		if(pageNumStr == null) {
			pageVO.setPageNum(1);
		}else if(pageNumStr != null) {
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		
		//pageVO.setTotalRecord();
		if(session.getAttribute("logType")!=null) {
			logType = (int)session.getAttribute("logType");
		}else {
			logType = 0;
		}
		int re = memberservice.memberCountBlack(logType,  selType);
		pageVO.setTotalRecord(re);
		
		mav.addObject("list", memberservice.memberselectblack(pageVO));
		mav.addObject("pageVO", pageVO); 
		mav.setViewName("/admin/customerLeaveList");
		return mav;
	} 
	
	
	  
	 
}