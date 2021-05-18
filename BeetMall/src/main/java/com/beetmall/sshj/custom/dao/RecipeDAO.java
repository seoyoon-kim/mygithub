package com.beetmall.sshj.custom.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.PageProductVO;
import com.beetmall.sshj.custom.vo.PageRecipeVO;
import com.beetmall.sshj.custom.vo.RecipeVO;



public interface RecipeDAO {

	public List<RecipeVO>RecipeAllList();

	public int recipeWriteOk(RecipeVO vo);
	
	public int RecipeLastSelect(RecipeVO vo);
	
	public RecipeVO RecipeSelect(int recipenum);

	public List<RecipeVO>recipeAllListHome(PageRecipeVO pageVO);
	
	public List<RecipeVO>recipeAllListHome2(PageRecipeVO pageVO);
	
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
	
	public int totalRecord4(PageRecipeVO pageVO);
	
}
