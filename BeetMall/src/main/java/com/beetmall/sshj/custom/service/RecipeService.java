package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.RecipeVO;

public interface RecipeService {
	public List<RecipeVO>RecipeAllList();
	
	public RecipeVO RecipeSelect(int recipenum);
	
	public int recipeWriteOk(RecipeVO vo);

	public int RecipeLastSelect(RecipeVO vo);
	
	public List<RecipeVO>RecipeAllListHome();
	
	public List<RecipeVO>customMyrecipe();
	
	public int recigoodOk(int data);
	
	public int recikeepOk(String id,int num);
	
	public int recigoodOk2(String id,int num);

}
