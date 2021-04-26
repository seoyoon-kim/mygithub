package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CenterServiceImp;
import com.beetmall.sshj.custom.vo.CenterVO;

////관리자에게 문의하기 VO=CenterVO
@Controller
public class CenterController {
	
	@Inject
	CenterServiceImp CenterService;
	
	//1:1문의 글쓰기
	@RequestMapping(value="/cusomerCenterWriteOk", method=RequestMethod.POST)
	public ModelAndView cusomerCenterWrite(CenterVO vo, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		CenterVO vo2 = (CenterVO)session.getAttribute("logVO"); 
//		vo2.setUserid(vo2.getUserid()); //없어서 이건 일단 주석처리함
		System.out.println("getContent " + vo.getContent());
		System.out.println("getQmtitle " + vo.getQmtitle());
		int result = CenterService.centerWrite(vo);
		if(result>0) {
			mav.setViewName("redirect:customerCenter");
		}else {
			mav.setViewName("redirect:customerCenterWrite");
		}
		return mav;
	}
	
}
