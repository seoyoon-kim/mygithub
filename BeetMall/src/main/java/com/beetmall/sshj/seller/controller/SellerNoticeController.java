package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerNoticeService;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

@Controller
public class SellerNoticeController {
	@Inject
	SellerNoticeService sellerNoticeService;
	
	@RequestMapping("/notice")
	public ModelAndView sellerNoticeAllRecord(SearchAndPageVO spvo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", sellerNoticeService.sellerNoticeAllRecord(spvo));
		//검색어가 있을 때,
		if(spvo.getSearchWord()!=null) { 		
			spvo.setSearchWord(spvo.getSearchWord());
			mav.addObject("noticeList", sellerNoticeService.sellerNoticeAllRecord(spvo) );
			System.out.println(" word=" + spvo.getSearchWord());
		}
		
		mav.setViewName("seller/notice");
		
		return mav;
	}
	@RequestMapping("/notice_view")
	public ModelAndView noticeView(int infonum, SearchAndPageVO sapvo) {
		ModelAndView mav = new ModelAndView();
		//조회수 증가
		sellerNoticeService.countInfoHit(infonum);
		//이전글다음글
		sellerNoticeService.lagLeadSelect(infonum);
		mav.addObject("sapvo", sellerNoticeService.lagLeadSelect(infonum));
		mav.addObject("nvo", sellerNoticeService.sellerNoticeSelect(infonum));
		//번호 확인 System.out.println("controller selected infonum :"+ infonum);
		mav.setViewName("seller/notice_view");
		return mav;
	}	
}
