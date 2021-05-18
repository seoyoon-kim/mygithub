package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.PageRecipeVO;
import com.beetmall.sshj.custom.vo.RecipeVO;

public interface RecipeService {
	public List<RecipeVO>RecipeAllList();
	
	public RecipeVO RecipeSelect(int recipenum);
	
	public int recipeWriteOk(RecipeVO vo);

	public int RecipeLastSelect(RecipeVO vo);
	
	public List<RecipeVO>recipeAllListHome();
	
	public List<RecipeVO>recipeAllListHome2();
	
	public List<RecipeVO>customMyrecipe();
	
	public int recigoodOk(int data);
	
	public int recigoodOk2(int num,String id);
	
	public int recigoodOnly(int num,String id);
	
    public int recigoodDelete(int num,String id);
	
	public int recikeepDelete(int num,String id);
	
	public int recikeepOk(int num,String id);
	
	public int recikeepOnly(int num,String id);
	
	public List<RecipeVO> customMyrecipe2(String id);
	
	public int recipeDelete(int recipenum);

	public int recipeEditeOk(RecipeVO vo);
	
	public int recipeHit(int data);
	
	public int recipetotalRecord(PageRecipeVO pageVO);

}
