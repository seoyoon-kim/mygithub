package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.RecipeVO;



public interface RecipeDAO {

	public List<RecipeVO>RecipeAllList();
	
	public int RecipeInsert(RecipeVO vo);
	
}
