package com.beetmall.sshj.seller.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView sellerNoticeAllRecord(SearchAndPageVO sapvo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(sellerNoticeService.totalRecord(sapvo));	
		//검색어가 있을 때,
		sapvo.setSearchWord(sapvo.getSearchWord());
		
		mav.addObject("sapvo",sapvo);
		mav.addObject("noticeList", sellerNoticeService.sellerNoticeAllRecord(sapvo) );
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
