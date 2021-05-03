package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CategoryDAO;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;

@Service
public class CategoryServiceImp implements CategoryService {
	
	@Inject
	CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryFarmVO> mapAllRecord() {
		return categoryDAO.mapAllRecord();
	}
	
}
