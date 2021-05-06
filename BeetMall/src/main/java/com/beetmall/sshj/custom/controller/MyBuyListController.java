package com.beetmall.sshj.custom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MyBuyListService;
import com.beetmall.sshj.custom.vo.MyBuyListVO;

@Controller
public class MyBuyListController {
	@Inject
	MyBuyListService mybuylistservice;
	
	@RequestMapping("mybuyList")
	public ModelAndView myBuyList(HttpSession session, HttpServletRequest req, MyBuyListVO mvo) {	// 구매내역
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		System.out.println("유저아이디="+userid);
		
		mav.addObject("list", mybuylistservice.selectBuyList(userid));
		mav.setViewName("mypages/mybuyList");
		return mav;
	}
	
	@RequestMapping("orderCommit")
	@ResponseBody
	public int orderCommit(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("num="+num);
		int result = 0;
		result = mybuylistservice.orderCommit(num);
		System.out.println("리턴 : "+result);
		
		return result;
	}
	
	@RequestMapping("orderCancel")
	@ResponseBody
	public int orderCancel(HttpServletRequest req) {
		int result = 0;
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
		if(mybuylistservice.orderCancel(ordernum)>=1) {
			result = -1;	// 배송중/배송완료인 상품
		}else {
			if(mybuylistservice.orderCancelOk(ordernum)>=1) {
				return 1;	// 취소 성공
			}else {
				return 0;	// 취소 실패
			}
		}
		return result;
	}
	
}