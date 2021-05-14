package com.beetmall.sshj.custom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CategoryService;
import com.beetmall.sshj.custom.vo.PageSearchVO;

@Controller
public class CategoryController {
	@Inject
	CategoryService categoryService;
	
	//지도부분
	@RequestMapping("/mapping")
	public ModelAndView mapping(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
		
		mav.addObject("list", categoryService.categorylist(pageVO));
		
		mav.addObject("list2", categoryService.mapAllRecord());
		mav.setViewName("custom/category/mapList2");
		mav.addObject("pageVO",pageVO);
		
		return mav;
	}
	
	//카테고리전체
	@RequestMapping("/categoryMain")
	public ModelAndView categoryMain(HttpServletRequest req, PageSearchVO pageVO) {
		ModelAndView mav = new ModelAndView();
		String item = "", //과일,채소,쌀잡곡등 품목들
				type="", //평점낮은순, 평점높은순, 가격순, 가격낮은순 
				pick=""; //픽업여부
		
		String pageNumStr = req.getParameter("pageNum");
		String itemlist = req.getParameter("item");
		String typelist = req.getParameter("type");
		String picklist = req.getParameter("pick");
		
		//페이지
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		
		//품목
		if(itemlist != null) {
			if(itemlist.equals("Fruit")) {
				item = "Fruit";
			}else if(itemlist.equals("vegetable")) {
				item = "vegetable";
			}else if(itemlist.equals("Rice")) {
				item = "Rice";
			}
			pageVO.setItem(item);
		}else {
			pageVO.setItem(null);
		}

		//타입 평점낮은순, 높은순 등등
		if(typelist != null) {
			if(typelist.equals("1")) {
				type = "1";
			}if(typelist.equals("2")) {
				type = "2";
			}if(typelist.equals("3")) {
				type = "3";
			}if(typelist.equals("4")) {
				type = "4";
			}
			pageVO.setType(typelist);
		}else {
			pageVO.setType(null);
		}
		
		if(picklist != null){
			pageVO.setPick("1");
		}else {
			pageVO.setPick(null);
		}
		
		if(type != null && !type.equals("") && item != null && !item.equals("") && pick != null && !pick.equals("")) { // 다 널이아닐때
			System.out.println("1");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setItem(item);
			pageVO.setPick("1");
			pageVO.setType(type);
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(type != null && !type.equals("") && item != null && !item.equals("")) { //타입이랑 품목만 널이아닐때
			System.out.println("2");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setItem(item);
			pageVO.setType(type);
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(item != null && !item.equals("") && pick != null && !pick.equals("")) { // 품목과 픽업여부만 널이아닐때
			System.out.println("3");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setItem(item);
			pageVO.setPick("1");
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(type != null && !type.equals("") && pick != null && !pick.equals("")) { // 타입과 픽업여부가 널이아닐때
			System.out.println("4");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setPick("1");
			pageVO.setType(type);
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(type != null && !type.equals("")) { // 타입만 널이아닐때
			System.out.println("5");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setType(type);
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(item != null && !item.equals("")) { // 품목만 널이아닐때
			System.out.println("6");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else if(pick != null && !pick.equals("")) { // 픽업여부만 널이아닐때
			System.out.println("7");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setPick("1");
			mav.addObject("list", categoryService.categorylist(pageVO));
		}else { //전부다 널일때
			System.out.println("8");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			mav.addObject("list", categoryService.categorylist(pageVO));
		}
		
		if(itemlist != null) {
			if(itemlist.equals("Fruit")) {
				mav.setViewName("custom/category/categoryFruit");
			}else if(itemlist.equals("vegetable")) {
				mav.setViewName("custom/category/categoryvegetable");
			}else if(itemlist.equals("Rice")) {
				mav.setViewName("custom/category/categoryRice");
			}
		}else {
			mav.setViewName("custom/category/categoryMain");
		}
		mav.addObject("pageVO",pageVO);
		return mav;
	}
	
	//지역별보기
	@RequestMapping("categoryCharge")
	public ModelAndView categoryCharge(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
		
		mav.addObject("list", categoryService.categoryCharge(pageVO));
		mav.setViewName("custom/category/categoryCharge");
		mav.addObject("pageVO",pageVO);
		
		return mav;
	}
	
	//가격대별보기
	@RequestMapping("payCategory")
	public ModelAndView payCategory(HttpServletRequest req, PageSearchVO pageVO) {
		ModelAndView mav = new ModelAndView();
		
		String pay = "", //가격
			   type=""; //타입 
		
		String pageNumStr = req.getParameter("pageNum");
		String paylist = req.getParameter("pay");
		String typelist = req.getParameter("type");
		pageVO.setPayStart(req.getParameter("payStart"));
		pageVO.setPayfinish(req.getParameter("payfinish"));
		
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		
		//가격
		if(paylist != null) {
			if(paylist.equals("5000")) {
				pay = "5000";
			}else if(paylist.equals("10000")) {
				pay = "10000";
			}else if(paylist.equals("50000")) {
				pay = "50000";
			}else if(paylist.equals("50001")) {
				pay = "50001";
			}
			pageVO.setPay(pay);
		}else {
			pageVO.setPay(null);
		}
		
		//타입 평점낮은순, 높은순 등등
		if(typelist != null) {
			if(typelist.equals("1")) {
				type = "1";
			}if(typelist.equals("2")) {
				type = "2";
			}if(typelist.equals("3")) {
				type = "3";
			}if(typelist.equals("4")) {
				type = "4";
			}
			pageVO.setType(type);
		}else {
			pageVO.setType(null);
		}
		
		if(type != null && !type.equals("") && pay != null && !pay.equals("")) {
			System.out.println("1");
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setType(type);
			pageVO.setPay(pay);
			mav.addObject("list", categoryService.payCategory(pageVO));
		}else {
			pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
			pageVO.setPay(pay);
			mav.addObject("list", categoryService.payCategory(pageVO));
		}
		mav.setViewName("custom/category/payCategory");
		mav.addObject("pageVO",pageVO);
		
		return mav;
	}
	//못난이할인
	@RequestMapping("/uglyItem")
	public ModelAndView uglyItem(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(categoryService.categoryOnetotalRecord(pageVO));
		
		mav.addObject("list", categoryService.uglyItem(pageVO));
		mav.setViewName("custom/category/uglyItem");
		mav.addObject("pageVO",pageVO);
		
		return mav;
	}
	
	//베스트상품
	@RequestMapping("/Bestcategory")
	public ModelAndView Bestcategory(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		
		String pageNumStr = req.getParameter("pageNum");
		
		PageSearchVO pageVO = new PageSearchVO();
		if(pageNumStr != null) {//페이지 번호가 있을때 숫자화, 없으면 1로 설정 설정되어있음.
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		//검색어, 검색키
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
		pageVO.setTotalRecord(categoryService.BestcategoryOnetotalRecord(pageVO));
		
		mav.addObject("list", categoryService.Bestcategory(pageVO));
		mav.setViewName("custom/category/Bestcategory");
		mav.addObject("pageVO",pageVO);
		
		return mav;
	}
	
	//픽업여부체크시
//	@RequestMapping("/pickupCheckTure")
//	@ResponseBody
//	public ModelAndView pickupCheckTure() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", categoryService.pickupCheckTure());
//		mav.setViewName("custom/category/category");
//		return mav;
//	}
//	
//	//픽업여부 해제시>메인으로
//	@RequestMapping("/pickupCheckFalse")
//	@ResponseBody
//	public ModelAndView pickupCheckFalse() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", categoryService.categorylist());
//		mav.setViewName("custom/category/category");
//		return mav;
//	}
//	
//	//평점높은순
//	@RequestMapping("/highhigh1")
//	@ResponseBody
//	public ModelAndView highhigh1(){
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", categoryService.highhigh1());
//		mav.setViewName("custom/category/category");
//		return mav;
//	}
//	
//	//평점낮은순
//	@RequestMapping("/lowlow1")
//	@ResponseBody
//	public ModelAndView lowlow1(){
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", categoryService.lowlow1());
//		mav.setViewName("custom/category/category");
//		return mav;
//	}
}
