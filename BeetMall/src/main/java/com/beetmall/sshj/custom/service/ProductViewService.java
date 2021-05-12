package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.ProductViewVO;

public interface ProductViewService {

	public ProductViewVO ProductViewSelect(int productnum);
	
    public ProductViewVO ProductViewSelectFarm(int productnum);
	
    public List<ProductViewVO> ProductViewSelectoption(int productnum);
    
	//////////////상품 할인가격 구하기
	public int PDprice(int productnum);
	
	//////////////옵션가격 구하기
	public String POprice(int optionnum);
}
