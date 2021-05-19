package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.beetmall.sshj.custom.service.CustomInfoServiceImp;
import com.beetmall.sshj.custom.vo.CustomInfoVO;
import com.beetmall.sshj.custom.vo.PageProductVO;


@Controller
public class CustomInfoController {
	@Inject
	CustomInfoServiceImp customInfoService;


		//리스트
		@RequestMapping("/custominfo")
		@ResponseBody
		public ModelAndView CustomInfoList(HttpSession session,HttpServletRequest req,PageProductVO pageVO,HttpServletResponse res) {
			String userid = (String)session.getAttribute("logId");
			ModelAndView mav = new ModelAndView();
			
			
			PageProductVO pageVO2=new PageProductVO();
			pageVO2.setUserid(userid);
			System.out.println("userid"+userid);
			//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
			String reqPageNum = req.getParameter("fpageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
			
			if(reqPageNum == null) {
				pageVO2.setPageNum(1);
			}else if(reqPageNum != null) {
				pageVO2.setPageNum(Integer.parseInt(reqPageNum));
			}
			
			//총 레코드 수 구하기  
			pageVO2.setTotalRecord(customInfoService.totalRecord8(userid));
			System.out.println("totalrecord 인포센터 ->" +  customInfoService.totalRecord8(userid)); //여기까지 나옴
			mav.addObject("pageVO2", pageVO2);
			
			mav.addObject("faqlist",customInfoService.CustomInfoAllRecord(pageVO2));
			mav.setViewName("custom/custominfo");
			return mav;
		}
		

		//글보기
		@RequestMapping("/CustomInfoView")
		public ModelAndView CustomInfoView(int qnum) {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("vo",customInfoService.CustomInfoSelect(qnum));
			mav.setViewName("custom/customInfoView");
			return mav;
		}
		
		//비공개처리하기
		
		@RequestMapping("/lockinfo")
		@ResponseBody
		public int lockinfo(HttpServletRequest req) {
			int num= Integer.parseInt(req.getParameter("num"));
			System.out.println(num);
			customInfoService.lockinfo(num);
			
			return customInfoService.lockinfo(num);
			
		}
	
	
	
}
