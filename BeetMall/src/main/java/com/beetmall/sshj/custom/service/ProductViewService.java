package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.ProductViewVO;

public interface ProductViewService {

	public ProductViewVO ProductViewSelect(int productnum);
	
    public ProductViewVO ProductViewSelectFarm(int productnum);
	
    public List<ProductViewVO> ProductViewSelectoption(int productnum);
    

	
}
