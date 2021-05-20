package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession; 
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_MemberServiceImp;
import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.BoardVO; 

@Controller
public class admin_sellerController {
	@Inject
	Boardervice adminService;
	 
	//////////////////////판매자 관리////////////////////////////////
	@Inject
	Admin_MemberServiceImp memberservice;
	//목록보기
		@RequestMapping("/sellerListA")
		public ModelAndView sellerListA(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int logType = 0;
			int selType = 2; // 판매자회원
			pageVO.setUserType(2); // 판매자회원만 조회할거라서 2;
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
			logType=3;
			int re = memberservice.memberCountSeller(logType,  selType);
			pageVO.setTotalRecord(re);
			System.out.println("re="+re);
			mav.addObject("list", memberservice.memberselectSellerAll(pageVO));
			mav.addObject("pageVO", pageVO);
			mav.setViewName("/admin/sellerListA");
			return mav;
		}
		
	//탈퇴 판매자 목록보기
		@RequestMapping("/sellerLeaveList")
		public ModelAndView sellerLeaveList(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int logType = 0;
			int selType = 5; // 탈퇴한 판매자회원
			pageVO.setUserType(5); // 탈퇴한 판매자회원만 조회할거라서 5;
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
			int re = memberservice.memberCountSeller(logType,  selType);
			pageVO.setTotalRecord(re);
			
			mav.addObject("list", memberservice.memberselectSeller(pageVO));
			mav.addObject("pageVO", pageVO);
			mav.setViewName("/admin/sellerLeaveList");
			return mav;
		}
	//판매자 블랙리스트 보기
		@RequestMapping("/sellerBlackList")
		public ModelAndView sellerBlackList(HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			Admin_Member_PageVO pageVO = new Admin_Member_PageVO();
			int logType = 0;
			int selType = 2; // 정지된 판매자회원
			pageVO.setUserType(2); // 정지된 판매자회원만 조회할거라서 2;
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
			mav.setViewName("/admin/sellerBlackList");
			return mav;
		} 
	//판매자 정보 수정
		@RequestMapping("/sellerInfoEditA")
		public ModelAndView sellerInfoEditA() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", adminService.noticeList());
			mav.setViewName("/admin/sellerInfoEditA");
			return mav;
		} 
		 
		 
	 
}