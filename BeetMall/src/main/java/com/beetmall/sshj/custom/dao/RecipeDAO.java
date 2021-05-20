package com.beetmall.sshj.custom.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.PageProductVO;
import com.beetmall.sshj.custom.vo.PageRecipeVO;
import com.beetmall.sshj.custom.vo.PageRecipeVO2;
import com.beetmall.sshj.custom.vo.RecipeVO;



public interface RecipeDAO {

	public List<RecipeVO>RecipeAllList(PageRecipeVO pageVO1);

	public int recipeWriteOk(RecipeVO vo);
	
	public int RecipeLastSelect(RecipeVO vo);
	
	public RecipeVO RecipeSelect(int recipenum);

	public List<RecipeVO>recipeAllListHome(PageRecipeVO pageVO1);
	
	public List<RecipeVO>recipeAllListHome2(PageRecipeVO pageVO2);
	
	public List<RecipeVO>customMyrecipe(PageRecipeVO2 pageVO1);
	
	public int recigoodOk(int data);
	
	public int recigoodOk2(int num,String id);
	
	public int recigoodOnly(int num,String id);
	
	public int recigoodDelete(int num,String id);
	
	public int recikeepDelete(int num,String id);
	
	public int recikeepOk(int num,String id);
	
	public int recikeepOnly(int num,String id);
	
	public List<RecipeVO> customMyrecipe2(PageRecipeVO2 pageVO2);
	
	public int recipeDelete(int recipenum);

	public int recipeEditeOk(RecipeVO vo);
	
	public int recipeHit(int data);
	
	public int totalRecord4(PageRecipeVO pageVO1);	
	public int totalRecord5(PageRecipeVO pageVO2);
	
	public int totalRecord6(String userid);
	public int totalRecord7(String userid);

	public int totalRecord8(PageRecipeVO pageVO1);
	
	
	
}
