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

	public int recipeWriteOk(RecipeVO vo) {
		return RecipeDAO.recipeWriteOk(vo);
	}

	@Override
	public RecipeVO RecipeSelect(int recipenum) {
		
		return RecipeDAO.RecipeSelect(recipenum);
	}

	@Override
	public List<RecipeVO> recipeAllListHome() {
		
		return RecipeDAO.recipeAllListHome();
	}

	@Override
	public List<RecipeVO> customMyrecipe() {
	
		return RecipeDAO.customMyrecipe();
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
	public int recikeepOk(String id,int num) {
		
		return RecipeDAO.recikeepOk(id,num);
	}

	@Override
	public int recigoodOk2(String id, int num) {
		
		return RecipeDAO.recigoodOk2(id,num);
	}

	@Override
	public List<RecipeVO> customMyrecipe2(String id){
		return RecipeDAO.customMyrecipe2(id);
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
	public List<RecipeVO> recipeAllListHome2() {
		
		return RecipeDAO.recipeAllListHome2();
	}


	
}
