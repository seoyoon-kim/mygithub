package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.PageProductVO;
import com.beetmall.sshj.custom.vo.ProductViewVO;



public interface ProductViewDAO {

	public ProductViewVO ProductViewSelect(int productnum);
	
	public ProductViewVO ProductViewSelectFarm(int productnum);
	
	public List<ProductViewVO> ProductViewSelectoption(int productnum);
	
	//////////////상품 할인가격 구하기
	public int PDprice(int productnum);
	
	//////////////옵션가격 구하기
	public String POprice(int optionnum);
	
	/////////////상품후기 구하기 REVIEW
	public List<ProductViewVO> ProductViewReview(PageProductVO pageVO1);
	
	////////////리뷰글 상세보기
	public ProductViewVO reviewViewSelect(int pnum,int rnum);
	
	//총 레코드 수 구하기
	public int totalRecord(PageProductVO pageVO1);
	
	public int totalRecord2(PageProductVO pageVO2);
	
	////////////상품문의 보기
	public List<ProductViewVO> ProductViewFaq(PageProductVO pageVO2);
	
	///////////장바구니에 넣기/////////////
	public ProductViewVO customWishInsert(String id,int productnum,int optnum,int pcount,int ocount);

	
	
}
