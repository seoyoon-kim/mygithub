package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CategoryDAO;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

@Service
public class CategoryServiceImp implements CategoryService {
	
	@Inject
	CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryFarmVO> mapAllRecord() {
		return categoryDAO.mapAllRecord();
	}

	@Override
	public List<CategoryVO> categorylist(PageSearchVO pageVO) {
		return categoryDAO.categorylist(pageVO);
	}

	@Override
	public int categoryOnetotalRecord(PageSearchVO pageVO) {
		return categoryDAO.categoryOnetotalRecord(pageVO);
	}

	@Override
	public List<CategoryVO> uglyItem(PageSearchVO pageVO) {
		return categoryDAO.uglyItem(pageVO);
	}

	@Override
	public List<CategoryVO> payCategory(PageSearchVO pageVO) {
		return categoryDAO.payCategory(pageVO);
	}

	@Override
	public List<CategoryVO> categoryCharge(PageSearchVO pageVO) {
		return categoryDAO.categoryCharge(pageVO);
	}

	@Override
	public List<CategoryVO> Bestcategory(PageSearchVO pageVO) {
		return categoryDAO.Bestcategory(pageVO);
	}

	@Override
	public int BestcategoryOnetotalRecord(PageSearchVO pageVO) {
		return categoryDAO.BestcategoryOnetotalRecord(pageVO);
	}

	@Override
	public List<CategoryVO> mapclick(String name) {
		return categoryDAO.mapclick(name);
	}

	@Override
	public int categoryChargeOnetotalRecord(PageSearchVO pageVO) {
		return categoryDAO.categoryChargeOnetotalRecord(pageVO);
	}
}
