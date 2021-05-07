package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CategoryDAO;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;

@Service
public class CategoryServiceImp implements CategoryService {
	
	@Inject
	CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryFarmVO> mapAllRecord() {
		return categoryDAO.mapAllRecord();
	}

	@Override
	public List<CategoryVO> categorylist() {
		return categoryDAO.categorylist();
	}
	
}
