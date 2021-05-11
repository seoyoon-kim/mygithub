package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.ProductViewVO;
import com.beetmall.sshj.custom.vo.RecipeVO;

public interface ProductViewDAO {

	public ProductViewVO ProductViewSelect(int productnum);
	
	public ProductViewVO ProductViewSelectFarm(int productnum);
	
	public List<ProductViewVO> ProductViewSelectoption(int productnum);
	

	
}
