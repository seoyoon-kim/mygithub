package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.ProductViewVO;

public interface ProductViewDAO {

	public ProductViewVO ProductViewSelect(int productnum);
	
	public ProductViewVO ProductViewSelectFarm(int productnum);
	
	public ProductViewVO ProductViewSelectoption(int productnum);
	
}
