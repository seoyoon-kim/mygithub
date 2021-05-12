package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.ProductViewVO;
import com.beetmall.sshj.custom.vo.RecipeVO;

public interface ProductViewDAO {

	public ProductViewVO ProductViewSelect(int productnum);
	
	public ProductViewVO ProductViewSelectFarm(int productnum);
	
	public List<ProductViewVO> ProductViewSelectoption(int productnum);
	
	//////////////상품 할인가격 구하기
	public int PDprice(int productnum);
	
	//////////////옵션가격 구하기
	public String POprice(int optionnum);
	
	/////////////상품후기 구하기 REVIEW
	public List<ProductViewVO> ProductViewReview(int productnum);
	
}
