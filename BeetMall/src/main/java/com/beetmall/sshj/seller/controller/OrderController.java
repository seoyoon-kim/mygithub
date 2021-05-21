package com.beetmall.sshj.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.OrderService;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order_management")
	public ModelAndView orderList( HttpSession session, SearchAndPageVO sapvo, HttpServletRequest req) {

		sapvo.setUserid((String)session.getAttribute("logId"));
		
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		ModelAndView mav = new ModelAndView();	
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
				
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(orderService.totalRecord(sapvo));
		
		List<OrderSaleVO> list = orderService.orderList(sapvo);
		 for(int i = 0; i<list.size(); i++){
		   OrderSaleVO vo = list.get(i);
		 }
		mav.addObject("list",list);
		
		//검색어와 페이징를 담기
		mav.addObject("searchWord",sapvo.getSearchWord());
		mav.addObject("sapvo",sapvo);
		
		mav.setViewName("seller/order_management"); 
		return mav; 
	}
	
	@RequestMapping("/oneOrderSelect")
	public ModelAndView oneRecordSelect(OrderSaleVO osvo, String ordernum, HttpSession session, SearchAndPageVO sapvo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		osvo.setUserid((String)session.getAttribute("logId"));
		
		//리퀘스트했을 때, 페이지 번호 확인 , 페이지 번호 있으면 가져온 값으로 세팅, 없으면 기본 값 = 1
		String reqPageNum = req.getParameter("pageNum");
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum));
		}
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
		mav.addObject(osvo.getOrdernum());
		mav.addObject("oneList", orderService.oneRecordSelect(ordernum));			
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(orderService.totalRecord(sapvo));
		mav.setViewName("seller/order_management"); 
		return mav; 
	}
}