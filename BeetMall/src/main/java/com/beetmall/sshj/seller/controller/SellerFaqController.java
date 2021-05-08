package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;

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
	public ModelAndView sellerfaqAllRecord(SearchAndPageVO spvo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqList", sellerfaqService.sellerfaqAllRecord());
		
		if(spvo.getSearchWord()!=null) { //%% like 연산자
			//spvo.setSearchWord("%"+spvo.getSearchWord()+"%");
			spvo.setSearchWord(spvo.getSearchWord());
			mav.addObject("faqList", sellerfaqService.searchList(spvo));
			System.out.println("key=" + spvo.getSearchKey()+" , word=" + spvo.getSearchWord());
		}
		
		mav.setViewName("seller/faq");
		return mav;
	}
}
