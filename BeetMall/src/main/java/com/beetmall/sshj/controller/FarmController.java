package com.beetmall.sshj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.service.FarmService;
import com.beetmall.sshj.vo.FarmVO;

@Controller
public class FarmController {
	@Autowired
	FarmService service;
	
	@RequestMapping("/seller_sales") // seller_sales 페이지
	public ModelAndView seller_sales() {
		ModelAndView mav = new ModelAndView();
		// 카테고리 리스트를 불러와서 리스트에 담는다
		// 대분류, 중분류 카테고리가 모두 들어있다.
		mav.addObject("cateList",service.allCategoryList());		
		mav.setViewName("seller/seller_sales");
		return mav;
	}
	
	@RequestMapping("/seller_review") // seller_review 페이지
	public String seller_review() {
		return "seller/seller_review";
	}
	
	@RequestMapping("/intro_farm") // intro_farm 페이지
	public String intro_review() {
		return "seller/intro_farm";
	}
	
	@RequestMapping("/edit_farm") // edit_farm 페이지
	public String edit_farm() {
		return "seller/edit_farm";
	}
	
	@RequestMapping("/getListData") // seller_sales 페이지에서 차트와 엑셀 데이터 가져오는 dao
	@ResponseBody
	public List<FarmVO> getListData(FarmVO vo,HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		System.out.println(vo.getResultData()[0]==1);
		System.out.println(vo.getStartCalendarDataValue());
		System.out.println(vo.getEndCalendarDataValue());
		
		
//		List<FarmVO> vo2 = service.salesDataList(vo);
//		System.out.println(vo2.get(0).getOrderprice());
//		mav.addObject("salesDataList", );
//		mav.setViewName("seller/seller_sales");
//		
		return service.salesDataList(vo);
	}
}
