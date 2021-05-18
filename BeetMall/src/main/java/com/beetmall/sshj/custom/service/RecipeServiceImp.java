package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.RecipeDAO;
import com.beetmall.sshj.custom.vo.PageRecipeVO;
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
	public int recikeepOk(int num,String id) {
		
		return RecipeDAO.recikeepOk(num,id);
	}

	@Override
	public int recigoodOk2(int num,String id) {
		
		return RecipeDAO.recigoodOk2(num,id);
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
	public int recipetotalRecord(PageRecipeVO pageVO) {
		// TODO Auto-generated method stub
		return RecipeDAO.recipetotalRecord(pageVO);
	}


	
}
