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
	
	//카테고리메인
	@RequestMapping("/categoryMain")
	public ModelAndView categoryMain(HttpServletRequest req, HttpServletResponse res) {
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
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("custom/category/categoryMain");
		
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
	public ModelAndView payCategory(HttpServletRequest req, HttpServletResponse res) {
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
		
		mav.addObject("list", categoryService.payCategory(pageVO));
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
}
