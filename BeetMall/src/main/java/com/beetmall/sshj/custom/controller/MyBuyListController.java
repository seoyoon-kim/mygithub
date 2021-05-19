package com.beetmall.sshj.custom.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MyBuyListService;
import com.beetmall.sshj.custom.vo.ClaimVO;
import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.PointPageVO;
import com.beetmall.sshj.custom.vo.ReviewVO;
import com.beetmall.sshj.custom.vo.UserQBoardVO;
import com.google.gson.JsonObject;

@Controller
public class MyBuyListController {
	@Inject
	MyBuyListService mybuylistservice;
	
	@RequestMapping("mybuyList")
	public ModelAndView myBuyList(HttpSession session, HttpServletRequest req, MyBuyListVO mvo) {	// 구매내역
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
		int month = 0;
		if(req.getParameter("month")!= null) {
			month = Integer.parseInt(req.getParameter("month"));
		}
		System.out.println("month="+month);
		
		if(month > 0) {
			System.out.println("1로 들어옴");
			pageVO.setTotalRecord(mybuylistservice.returnPageRecordMonth(userid, month));
			System.out.println("결과="+pageVO.getTotalRecord());
		}else {
			System.out.println("2로 들어옴");
			pageVO.setTotalRecord(mybuylistservice.returnPageRecord(userid));
			System.out.println("결과="+pageVO.getTotalRecord());
		}

		pageVO.setMonth(month);
		mav.addObject("pageVO", pageVO);
		mav.addObject("month",month);
		mav.addObject("list", mybuylistservice.selectBuyList(pageVO));
		System.out.println("list="+(mybuylistservice.selectBuyList(pageVO)).size());
		mav.setViewName("mypages/mybuyList");
		return mav;
	}
	
	@RequestMapping("orderCommit")
	@ResponseBody
	public int orderCommit(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
//		System.out.println("num="+num);
		int result = 0;
		result = mybuylistservice.orderCommit(num);
//		System.out.println("리턴 : "+result);
		
		return result;
	}
	
	@RequestMapping("orderCancel")
	@ResponseBody
	public int orderCancel(HttpServletRequest req) {
		int result = 0;
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
//		System.out.println("ordernum="+ordernum);
//		System.out.println("ordercancel="+mybuylistservice.orderCancel(ordernum));
		
		if(mybuylistservice.orderCancel(ordernum)>=1) {
			result = -1;	// 배송중/배송완료인 상품
		}else if(mybuylistservice.orderCancel(ordernum)==0){
			if(mybuylistservice.orderCancelOk(ordernum)>=1) {
				result = 1;	// 취소 성공
			}else {
				result = 0;	// 취소 실패
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
//		System.out.println("producntnum"+productNum);
		MyBuyListVO vo = mybuylistservice.selectReviewProduct(productNum);
		return vo;
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public ModelAndView reviewWrite(HttpServletRequest req, HttpSession session, ReviewVO vo,  @RequestParam MultipartFile file) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
//		System.out.println("userid == "+vo.getUserid());	// qwer
//		System.out.println("oerdernum == "+vo.getOrdernum());	//29
//		System.out.println("productnum == "+vo.getProductnum());	// 1
//		System.out.println("reviewanswer == "+vo.getReviewanswer());	// 널 	
//		System.out.println("reviewcontent == "+vo.getReviewcontent());	//첨부한 이미지까지 여기 같이 있음
//		System.out.println("reviewimg == "+vo.getReviewimg());	// 널
//		System.out.println("reviewnum == "+vo.getReviewnum());	// 0
//		System.out.println("reviewcoomend == "+vo.getReviewrecommend());	// 0
//		System.out.println("reviewreport == "+vo.getReviewreport());	// 0
//		System.out.println("reviewscore == "+vo.getReviewscore());	// 5.0
//		System.out.println("reviewwritedate == "+vo.getReviewwritedate());	// 널
		
		//////////////////// 파일 업로드 start)
		String path = req.getSession().getServletContext().getRealPath("resources/reviewThumbImgs");
//		System.out.println("path="+path);
		String paramName = file.getName();
		String orgName = file.getOriginalFilename();
//		System.out.println(paramName+", "+orgName);
		
		try {
			if(orgName != null) {
				File f = new File(path, orgName);
				int i = 1;
				while(f.exists()) {
					int point = orgName.lastIndexOf(".");
					String name = orgName.substring(0, point);
					String extName = orgName.substring(point+1);
					
					f = new File(path, name+"_"+ i++ + "." + extName);
				}// while
				orgName = f.getName();
				
				try {
					file.transferTo(new File(path,orgName));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		vo.setReviewimg(orgName);
		int result = mybuylistservice.reviewWrite(vo);
		//////////////////// 파일 업로드 end)
//		System.out.println("reviewcontent == "+vo.getReviewcontent());	//첨부한 이미지까지 여기 같이 있음
//		System.out.println("reviewimg == "+vo.getReviewimg());	// 널
		
		////////////////////등록 실패시 파일 삭제
		if(result <=0) {
			if(orgName != null) {
				File delf = new File(path, orgName);
				delf.delete();
				
			}
		}
		////////////////////파일 삭제 end)
		mav.setViewName("redirect:mybuyList");
		return mav;
	}
	@RequestMapping("reviewSelect")
	@ResponseBody
	public ReviewVO ReviewSelect(ReviewVO vo, HttpServletRequest req, HttpSession session) {
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
		vo = mybuylistservice.reviewSelect(ordernum);
		return vo;
	}

//	@RequestMapping("reviewlikeCount")
//	@ResponseBody
//	public int ReviewLikeCount(HttpServletRequest req) {
//		int result = 0;
//		int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
//		result = mybuylistservice.reviewgoodCount(reviewnum);
//		return result;
//	}
	
	@RequestMapping("goodCheck")
	@ResponseBody
	public int reviewCheck(HttpSession session, HttpServletRequest req) {
		int result = -1;
//		System.out.println(req.getParameter("reviewnum"));
		if(req.getParameter("reviewnum") == null) {
			result = 0;
		}else if(req.getParameter("reviewnum") != null) {
			int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
			String userid = (String)session.getAttribute("logId");
			result = mybuylistservice.reviewcheck(reviewnum, userid);
		}
		
		return result;
	}
	
	@RequestMapping("reviewgoodcancel")
	@ResponseBody
	public int reviewGoodCanel(HttpSession session, HttpServletRequest req) {
		int result = -1;
		int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
		String userid = (String)session.getAttribute("logId");
		result = mybuylistservice.reviewGoodCancel(reviewnum, userid);
		return result;
	}
	
	
	@RequestMapping("reviewgoodOk")
	@ResponseBody
	public int reviewGood(HttpSession session, HttpServletRequest req) {
		int result = -1;
		int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
		String userid = (String)session.getAttribute("logId");
		result = mybuylistservice.reviewGood(reviewnum, userid);
		return result;
	}
	
	@RequestMapping(value="tradeCommit", method=RequestMethod.POST)
	public ModelAndView claimInsert(ClaimVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int productnum = Integer.parseInt(req.getParameter("productnum"));
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
		String claimkind = req.getParameter("claimkind");
		vo.setProductnum(productnum);
		vo.setOrdernum(ordernum);
		vo.setClaimkind(claimkind);
//		System.out.println("getClaimcontent -->"+vo.getClaimcontent());	// ㅇㅇ
//		System.out.println("getClaimdate -->"+vo.getClaimdate());		// 널 요거는 sysdate
//		System.out.println("getClaimkind -->"+vo.getClaimkind());		// ㅇㅇ 이거로 조절하면 될듯
		
		int kind = Integer.parseInt(vo.getClaimkind());
		String status = "";
		
		
		if(kind == 1) {
			vo.setClaimstatus("반품");
			status = "반품 진행중";
		}else if(kind == 2) {
			vo.setClaimstatus("환불");
			status = "환불 진행중";
		}else {
			vo.setClaimstatus("오류");
		}
//		System.out.println("getClaimstatus -->"+vo.getClaimstatus());	// ㄴㄴ
//		System.out.println("getDelivery -->"+vo.getDelivery());			// ㅇㅇ
//		System.out.println("getInvoice -->"+vo.getInvoice());			// ㅇㅇ
//		System.out.println("getOrdernum -->"+vo.getOrdernum());			// ㅇㅇ
//		System.out.println("getProductnum -->"+vo.getProductnum());		//ㅇㅇ
		
		
		mybuylistservice.claimInsert(vo);
		mybuylistservice.claimUpdate(ordernum, status);
		
		
		mav.setViewName("redirect:mybuyList");
		
		return mav;
	}
	
	@RequestMapping("returnView")
	@ResponseBody
	public ClaimVO returnSelect(int ordernum, ClaimVO vo) {
//		System.out.println("주문번호"+ordernum);
		vo = mybuylistservice.returnSelect(ordernum);
		
		return vo;
	}
	@RequestMapping(value="questionWrite")
	public ModelAndView questionWrite(int productnum, HttpSession session, UserQBoardVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
//		System.out.println("productnum-->"+vo.getProductnum());
//		System.out.println("답변은 원래 널-->"+vo.getQanswer());
//		System.out.println("내용-->"+vo.getQcontent());
//		System.out.println("q넘버 시퀀스라 노상관-->"+vo.getQnum());
//		System.out.println("N으로 옴 잘온거-->"+vo.getQopen());
//		System.out.println("널 맞음 sysdate-->"+vo.getQwritedate());
//		System.out.println("아이디 잘옴-->"+vo.getUserid());
//		System.out.println("qtitle"+vo.getQtitle());
		mybuylistservice.qboardInsert(vo);
		mav.setViewName("redirect:mybuyList");
		return mav;
	}
	@RequestMapping("returnSubmit")
	public ModelAndView returnFinish(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int ordernum = Integer.parseInt(req.getParameter("ordernum"));
//		System.out.println("ordernum ="+ordernum);
		mybuylistservice.returnFinish(ordernum);
		
		mav.setViewName("redirect:mybuyList");
		return mav;
	}
	
	@RequestMapping("monthmybuyList")
	public ModelAndView monthmyBuyList(HttpSession session, HttpServletRequest req, MyBuyListVO mvo) {	// 구매내역
		ModelAndView mav = new ModelAndView();		
		String userid = (String)session.getAttribute("logId");
		int month = Integer.parseInt(req.getParameter("month"));
//		System.out.println("month-"+month);
		mav.addObject("list", mybuylistservice.monthSelectBuyList(userid, month));
		mav.setViewName("mypages/mybuyList");
		return mav;
	}
}