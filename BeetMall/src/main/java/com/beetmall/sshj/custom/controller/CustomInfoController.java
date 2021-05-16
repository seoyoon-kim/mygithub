package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.beetmall.sshj.custom.service.CustomInfoServiceImp;
import com.beetmall.sshj.custom.vo.CustomInfoVO;


@Controller
public class CustomInfoController {
	@Inject
	CustomInfoServiceImp customInfoService;

	//글쓰기
		@RequestMapping("/CustomInfoWrite")
		public String customInfoWrite() {
			return "custom/customInfoWrite";
		}
	
		@RequestMapping(value="/CustomInfoWriteOk", method=RequestMethod.POST)
		public ModelAndView CustomInfoWriteOk(CustomInfoVO vo, HttpServletRequest req, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			int result = customInfoService.CustomInfoWrite(vo);
			if(result>0) {
				mav.setViewName("redirect:customInfo");
			}else {
				mav.setViewName("redirect:customInfoWrite");
			}
			return mav;
		}
	
		
		//리스트
		@RequestMapping("/CustomInfoList")
		public ModelAndView CustomInfoList() {
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list",customInfoService.CustomInfoAllRecord());
			mav.setViewName("custom/customInfo");
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
	
	
	
}
