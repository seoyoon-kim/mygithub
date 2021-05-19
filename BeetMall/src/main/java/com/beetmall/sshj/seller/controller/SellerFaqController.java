package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerFaqService;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Controller
public class SellerFaqController {
	@Inject
	SellerFaqService sellerfaqService;
	
	@RequestMapping("/faq")
	public ModelAndView sellerfaqAllRecord(SearchAndPageVO sapvo,  HttpServletRequest req) {
		
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		
		ModelAndView mav = new ModelAndView();
		
		//검색어와 검색키가 있을 때,
		sapvo.setSearchWord(sapvo.getSearchWord());
		sapvo.setSearchKey(sapvo.getSearchKey());
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(sellerfaqService.totalRecord(sapvo));
		System.out.println("totalrecord ->" +  sellerfaqService.totalRecord(sapvo));
				
		mav.addObject("sapvo",sapvo);
		mav.addObject("faqList", sellerfaqService.sellerfaqAllRecord(sapvo));
		mav.setViewName("seller/faq");
		return mav;
	}
}
