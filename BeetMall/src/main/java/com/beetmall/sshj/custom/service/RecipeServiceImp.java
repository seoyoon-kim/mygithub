package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.RecipeDAO;
import com.beetmall.sshj.custom.vo.RecipeVO;

@Service
public class RecipeServiceImp implements RecipeService {

	@Inject
	RecipeDAO RecipeDAO;
	
	@Override
	public List<RecipeVO> RecipeAllList() {
		
		return RecipeDAO.RecipeAllList();
	}

	@Override
	public int RecipeInsert(RecipeVO vo) {
		
		return RecipeDAO.RecipeInsert(vo);
	}

}
