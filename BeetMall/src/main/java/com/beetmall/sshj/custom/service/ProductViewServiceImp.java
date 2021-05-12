package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.ProductViewDAO;
import com.beetmall.sshj.custom.vo.ProductViewVO;

@Service
public class ProductViewServiceImp implements ProductViewService {

	
	@Inject
	ProductViewDAO productVeiwDAO;

	@Override
	public ProductViewVO ProductViewSelect(int productnum) {		
		return productVeiwDAO.ProductViewSelect(productnum);
	}

	
	
	@Override
	public ProductViewVO ProductViewSelectFarm(int productnum) {		
		return productVeiwDAO.ProductViewSelectFarm(productnum);			
	}

	
	
	@Override
	public List<ProductViewVO> ProductViewSelectoption(int productnum) {
		return productVeiwDAO.ProductViewSelectoption(productnum);		
	}



	@Override
	public int PDprice(int productnum) {
		
		return productVeiwDAO.PDprice(productnum);
	}



	@Override
	public String POprice(int optionnum) {
		
		return productVeiwDAO.POprice(optionnum);
	}



	
	
}

