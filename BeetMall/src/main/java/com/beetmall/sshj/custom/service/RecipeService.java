package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.RecipeVO;

public interface RecipeService {
	public List<RecipeVO>RecipeAllList();
	
	public int RecipeInsert(RecipeVO vo);
}
