package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CustomInfoService;
import com.beetmall.sshj.custom.service.CustomInfoServiceImp;
import com.beetmall.sshj.custom.vo.CustomInfoVO;


public class CustomInfoController {
	@Inject
	CustomInfoServiceImp customInfoService;

	//글쓰기
		@RequestMapping(value="/CustomInfoWriteOk", method=RequestMethod.POST)
		public ModelAndView CustomInfoWrite(CustomInfoVO vo, HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			int result = customInfoService.CustomInfoWrite(vo);
			if(result>0) {
				mav.setViewName("redirect:CustomInfo");
			}else {
				mav.setViewName("redirect:CustomInfoWrite");
			}
			return mav;
		}
		
		
		//리스트
		@RequestMapping("/CustomInfo")
		public ModelAndView CustomInfoList() {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list",customInfoService.CustomInfoAllRecord());
			mav.setViewName("custom/CustomInfo");
			return mav;
		}
		
		//글보기
		@RequestMapping("/CustomInfo")
		public ModelAndView CustomInfoView(int qnum) {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("vo",customInfoService.CustomInfoSelect(qnum));
			mav.setViewName("custom/CustomInfoView");
			return mav;
		}
	
	
	
}
