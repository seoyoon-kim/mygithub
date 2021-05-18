package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.ProductViewDAO;
import com.beetmall.sshj.custom.vo.PageProductVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;
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
	public ProductViewVO reviewViewSelect(int pnum, int rnum) {
		
		return productVeiwDAO.reviewViewSelect(pnum,rnum);
	}



	@Override
	public List<ProductViewVO> ProductViewFaq(PageProductVO pageVO2) {
		
		return productVeiwDAO.ProductViewFaq(pageVO2);
	}



	@Override
	public List<ProductViewVO> ProductViewReview(PageProductVO pageVO1) {
		
		return productVeiwDAO.ProductViewReview(pageVO1);
	}



	@Override
	public int totalRecord(PageProductVO pageVO1) {
		
		return productVeiwDAO.totalRecord(pageVO1);
	}
	
	@Override
	public int totalRecord2(PageProductVO pageVO2) {
		
		return productVeiwDAO.totalRecord2(pageVO2);
	}



	@Override
	public ProductViewVO customWishInsert(String id, int productnum, int optnum, int pcount, int ocount) {
	
		return productVeiwDAO.customWishInsert(id,productnum,optnum,pcount,ocount);
	}



	@Override
	public List<ProductViewVO> customWishView(PageProductVO pageVO1) {
		
		return productVeiwDAO.customWishView(pageVO1);
	}



	@Override
	public int totalRecord3(String userid) {
		
		return productVeiwDAO.totalRecord3(userid);
	}






	
	
}

