package com.beetmall.sshj.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.adminProductService;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
 

@Controller
public class admin_productController { 
	
	@Inject
	adminProductService productService;
	//////////////////////상품 관리///////////////////////////////////// 

	//상품 목록 보기
	@RequestMapping("/productListA")
	public ModelAndView productListA(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		adminkPageSearchVO pageVO = new adminkPageSearchVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(productService.productOnetotalRecord(pageVO));
		
		mav.addObject("list", productService.productList(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/productListA");
		
		return mav;
	}
	
	//검색해서 리스트 정렬해주기
	
	
	//상품수정페이지 들어가기
	@RequestMapping("/productEditA")
	public String productEditA() {
		return "admin/productEditA";
	}
}
	
	
	
  
	
	 