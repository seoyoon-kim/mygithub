package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.RecipeDAO;
import com.beetmall.sshj.custom.vo.PageRecipeVO;
import com.beetmall.sshj.custom.vo.PageRecipeVO2;
import com.beetmall.sshj.custom.vo.RecipeVO;

@Service
public class RecipeServiceImp implements RecipeService {

	@Inject
	RecipeDAO RecipeDAO;
	
	@Override
	public List<RecipeVO> RecipeAllList(PageRecipeVO pageVO1) {
		
		return RecipeDAO.RecipeAllList(pageVO1);
	}

	public int recipeWriteOk(RecipeVO vo) {
		return RecipeDAO.recipeWriteOk(vo);
	}

	@Override
	public RecipeVO RecipeSelect(int recipenum) {
		
		return RecipeDAO.RecipeSelect(recipenum);
	}

	@Override
	public List<RecipeVO> recipeAllListHome(PageRecipeVO pageVO1) {
		
		return RecipeDAO.recipeAllListHome(pageVO1);
	}

	@Override
	public List<RecipeVO> customMyrecipe(PageRecipeVO2 pageVO1) {
	
		return RecipeDAO.customMyrecipe(pageVO1);
	}

	@Override
	public int RecipeLastSelect(RecipeVO vo) {
		
		return  RecipeDAO.RecipeLastSelect(vo);
	}

	@Override
	public int recigoodOk(int data) {
		
	 return RecipeDAO.recigoodOk(data);
	}

	@Override
	public int recikeepOk(int num,String id) {
		
		return RecipeDAO.recikeepOk(num,id);
	}

	@Override
	public int recigoodOk2(int num,String id) {
		
		return RecipeDAO.recigoodOk2(num,id);
	}

	@Override
	public List<RecipeVO> customMyrecipe2(PageRecipeVO2 pageVO2){
		return RecipeDAO.customMyrecipe2(pageVO2);
	}


	@Override
	public int recipeEditeOk(RecipeVO vo) {
		
		return RecipeDAO.recipeEditeOk(vo);
	}

	@Override
	public int recipeDelete(int recipenum) {
		
		return RecipeDAO.recipeDelete(recipenum);
	}

	@Override
	public List<RecipeVO> recipeAllListHome2(PageRecipeVO pageVO2) {
		
		return RecipeDAO.recipeAllListHome2(pageVO2);
	}

	@Override
	public int recipeHit(int data) {
		
		return RecipeDAO.recipeHit(data);
	}

	@Override
	public int recikeepOnly(int num,String id) {
		
		return RecipeDAO.recikeepOnly(num,id);
	}

	@Override
	public int recigoodOnly(int num,String id) {
		return RecipeDAO.recigoodOnly(num,id);
	}

	@Override
	public int recigoodDelete(int num, String id) {
		
		return RecipeDAO.recigoodDelete(num, id);
	}

	@Override
	public int recikeepDelete(int num, String id) {
		// TODO Auto-generated method stub
		return RecipeDAO.recikeepDelete(num, id);
	}

	@Override
	public int totalRecord4(PageRecipeVO pageVO1) {
		// TODO Auto-generated method stub
		return RecipeDAO.totalRecord4(pageVO1);
	}

	@Override
	public int totalRecord5(PageRecipeVO pageVO2) {
		
		return RecipeDAO.totalRecord4(pageVO2);
	}

	@Override
	public int totalRecord6(String userid) {
		// TODO Auto-generated method stub
		return RecipeDAO.totalRecord6(userid);
	}

	@Override
	public int totalRecord7(String userid) {
		// TODO Auto-generated method stub
		return RecipeDAO.totalRecord7(userid);
	}

	public int totalRecord8(PageRecipeVO pageVO1) {
		// TODO Auto-generated method stub
		return RecipeDAO.totalRecord8(pageVO1);
	}




	
}
