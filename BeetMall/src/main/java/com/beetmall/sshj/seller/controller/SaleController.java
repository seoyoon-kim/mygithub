package com.beetmall.sshj.seller.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SaleService;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
@Controller
public class SaleController {
	@Autowired
	SaleService saleService;
	
	
	//목록 전체보기
	@RequestMapping("/sale_management")
	public ModelAndView saleList(SearchAndPageVO sapvo, HttpSession session, HttpServletRequest req){
		 ModelAndView mav = new ModelAndView();
		sapvo.setUserid((String)session.getAttribute("logId"));
		System.out.println("id->"+sapvo.getUserid());
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
						
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(saleService.totalRecord(sapvo));
		//리스트에 담기
		 List<OrderSaleVO> list = saleService.saleList(sapvo);
		 for(int i = 0; i<list.size(); i++){
		   OrderSaleVO vo = list.get(i);
		 }
		 mav.addObject("list",list);
		//검색어와 페이징를 담기
		mav.addObject("searchWord",sapvo.getSearchWord());
		mav.addObject("sapvo",sapvo);
		System.out.println("orderList totalPage->"+sapvo.getTotalPage()); //전체 페이지수
		System.out.println("orderList searchWord->"+sapvo.getSearchWord());
		mav.setViewName("seller/sale_management");
		 return mav;
	}




//모달에 들어가는 레코드 한개 불러오기
// 판매 상태 변경
@RequestMapping("/claimStatusUpdate")
public String claimStatusUpdate(@RequestParam(value="orderNumArr") List<String> orderNumList, @RequestParam(value="claimStatus") String claimstatus,OrderSaleVO osvo) {
	//ModelAndView mav = new ModelAndView();
	//ajax의 valArr에서 받은 orderNumList 를 하나씩 꺼내서 ArrayList에 담음
	ArrayList<String> orderNumArr = new ArrayList<String>(); 
	System.out.println("claimStatus->"+ claimstatus);
	System.out.println("orderNumList->"+ orderNumList);
	for(int i = 0 ; i < orderNumList.size(); i++) {
		orderNumArr.add(orderNumList.get(i));
		System.out.println("orderNumArr->"+ orderNumArr);
	}
	for(int i = 0; i < orderNumArr.size(); i++) {
		String ordernum = orderNumArr.get(i);
		System.out.println("update ordernum ->" + ordernum);
		saleService.claimStatusUpdate(ordernum, claimstatus);
	}
	return "redirect:sale_management";
}
}