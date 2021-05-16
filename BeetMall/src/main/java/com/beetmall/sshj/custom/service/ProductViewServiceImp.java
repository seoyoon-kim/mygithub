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



	@Override
	public List<ProductViewVO> ProductViewReview(int productnum) {

		return productVeiwDAO.ProductViewReview(productnum);
	}



	@Override
	public ProductViewVO reviewViewSelect(int pnum, int rnum) {
		
		return productVeiwDAO.reviewViewSelect(pnum,rnum);
	}



	@Override
	public List<ProductViewVO> ProductViewFaq(int productnum) {
		
		return productVeiwDAO.ProductViewFaq(productnum);
	}



	@Override
	public ProductViewVO customWishInsert(String id, int productnum, int pcount, int optnum, int ocount) {
		
		return productVeiwDAO.customWishInsert(id,productnum,optnum,pcount,ocount);
	}






	
	
}

