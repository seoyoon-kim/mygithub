package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.CsQuestionService;
import com.beetmall.sshj.admin.vo.CsQuestionVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Controller
public class admin_csQuestionController {
	
	@Inject
	CsQuestionService csquestionService;
	
	@RequestMapping("/csQuestionA")
	public ModelAndView csQuestionA(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(csquestionService.csQuestOnetotalRecord(pageVO));
		
		mav.addObject("list",csquestionService.csQuestList(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/csQuestionA");
		
		return mav;
	}
	
	@RequestMapping("/csAnswerA")
	public ModelAndView csAnswerA(int qmnum) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", csquestionService.csAnswerWrite(qmnum));
		mav.setViewName("/admin/csAnswerA");
		return mav;
	}
	
	@RequestMapping(value="/csAnswerWriteOk", method=RequestMethod.POST)
	public ModelAndView csAnswerWrite(CsQuestionVO vo) {
		ModelAndView mav = new ModelAndView();
		
		int result = csquestionService.csAnswerWriteOk(vo);
		if(result>0) {
			mav.setViewName("redirect:csQuestionA");
		}else {
			mav.setViewName("redirect:csAnswerA");
		}
		return mav;
	}
}
