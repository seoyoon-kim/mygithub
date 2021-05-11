package com.beetmall.sshj.seller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.EditService;
import com.beetmall.sshj.seller.service.ProductService;
import com.beetmall.sshj.seller.vo.EditVO;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;

@Controller
public class EditFarmController {
	
	@Autowired
	EditService service;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/edit_farm")
	public ModelAndView edit_farm(HttpSession session, ProductVO vo, SearchAndPageVO spvo) {
		ModelAndView mav = new ModelAndView();
	
		if(session.getAttribute("logId")!=null) {
			String userid = (String)session.getAttribute("logId");

			if((int)session.getAttribute("logType") == 2 ) {
				mav.addObject("result", service.selectInfo(userid)); // 전체 데이터 불러오기
				mav.addObject("favorite", service.selectFavorite(userid)); // 즐겨찾기 수 불러오기
				mav.setViewName("seller/edit_farm");
			}	else {
				mav.setViewName("redirect:/");
				
			}
			
			vo.setUserid(userid);
			List<ProductVO> list = productService.productAllSelect(vo.getUserid());
			System.out.println(list.size());
			mav.addObject("productList", productService.productAllSelect(vo.getUserid()));
			
			  if(spvo.getSearchWord()!=null) { //%% like 연산자
					//spvo.setSearchWord("%"+spvo.getSearchWord()+"%");
					spvo.setSearchWord(spvo.getSearchWord());
					mav.addObject("productList", productService.productAllSelect(vo.getUserid()));
					mav.addObject("productList", productService.searchList(spvo)); 
					System.out.println("word=" + spvo.getSearchWord());
			  }
			
		} else {
			mav.setViewName("redirect:/");
			
		}
		
		
		return mav;
	}
}
