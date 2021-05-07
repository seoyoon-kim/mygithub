package com.beetmall.sshj.custom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MyBuyListService;
import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.ReviewVO;

@Controller
public class MyBuyListController {
	@Inject
	MyBuyListService mybuylistservice;
	
	@RequestMapping("mybuyList")
	public ModelAndView myBuyList(HttpSession session, HttpServletRequest req, MyBuyListVO mvo) {	// 구매내역
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		//System.out.println("유저아이디="+userid);
		
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
	
	@RequestMapping("reviewCheck")
	@ResponseBody
	public int reviewCheck(HttpServletRequest req) {
		int result = 0;
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
		int reviewCheck = mybuylistservice.reviewCheck(ordernum);
		System.out.println("여기니??"+reviewCheck);
		if(reviewCheck<=0) {
			result = 1;
		}else {
			result = -1;
		}
		return result;
	}
	
	@RequestMapping("productInfo")
	@ResponseBody
	public MyBuyListVO productImgName(HttpServletRequest req) {
		int productNum = Integer.parseInt(req.getParameter("productNum"));
		System.out.println("producntnum"+productNum);
		MyBuyListVO vo = mybuylistservice.selectReviewProduct(productNum);
		return vo;
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public int reviewWrite(HttpServletRequest req, HttpSession session, ReviewVO vo) {
		int result = 0;
		vo.setUserid((String)session.getAttribute("logId"));
//		System.out.println("userid == "+vo.getUserid());	// qwer
//		System.out.println("oerdernum == "+vo.getOrdernum());	//29
//		System.out.println("productnum == "+vo.getProductnum());	// 1
//		System.out.println("reviewanswer == "+vo.getReviewanswer());	// 널 	
		System.out.println("reviewcontent == "+vo.getReviewcontent());	//첨부한 이미지까지 여기 같이 있음
		System.out.println("reviewimg == "+vo.getReviewimg());	// 널
//		System.out.println("reviewnum == "+vo.getReviewnum());	// 0
//		System.out.println("reviewcoomend == "+vo.getReviewrecommend());	// 0
//		System.out.println("reviewreport == "+vo.getReviewreport());	// 0
		System.out.println("reviewscore == "+vo.getReviewscore());	// 5.0
//		System.out.println("reviewwritedate == "+vo.getReviewwritedate());	// 널
		
		return result;
	}
}