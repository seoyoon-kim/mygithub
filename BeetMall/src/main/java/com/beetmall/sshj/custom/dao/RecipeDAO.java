package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.RecipeVO;



public interface RecipeDAO {

	public List<RecipeVO>RecipeAllList();

	public int recipeWriteOk(RecipeVO vo);
	
	public int RecipeLastSelect(RecipeVO vo);
	
	public RecipeVO RecipeSelect(int recipenum);

	public List<RecipeVO>RecipeAllListHome();
	
	public List<RecipeVO>customMyrecipe();
	
	public int recigoodOk(int recipenum);
}
