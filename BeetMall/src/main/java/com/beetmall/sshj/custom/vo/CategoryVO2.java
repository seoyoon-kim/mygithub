package com.beetmall.sshj.custom.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CategoryVO2 {
	//상품 product
	private int productnum2;//상품번호
	private String productname2;//상품이름
	private int productprice2;//상품가격
	private String thumbimg2;//이미지
	private int proprice2;//실가격
	
	//리뷰
	private String totalscore2; //별점
	private String sumreview2; //리뷰총갯수
	
	//회원
	private String username2;//판매자 이름
	
	//판매자
	private String storeaddr2;//판매자 주소 
	
	//할인
	private int saleprice2; //할인액
	private String salestart2;//할인시작일
	private String salefinish2;//할인끝나는날
	
	
	//날짜함수
	SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = new Date();
	
	public int getProductnum2() {
		return productnum2;
	}
	public void setProductnum2(int productnum2) {
		this.productnum2 = productnum2;
	}
	public String getProductname2() {
		return productname2;
	}
	public void setProductname2(String productname2) {
		this.productname2 = productname2;
	}
	public int getProductprice2() {
		return productprice2;
	}
	public void setProductprice2(int productprice2) {
		this.productprice2 = productprice2;
	}
	public String getThumbimg2() {
		return thumbimg2;
	}
	public void setThumbimg2(String thumbimg2) {
		this.thumbimg2 = thumbimg2;
	}
	public String getTotalscore2() {
		return totalscore2;
	}
	public void setTotalscore2(String totalscore2) {
		totalscore2 = totalscore2.substring(0, 1);
		this.totalscore2 = totalscore2;
	}
	public String getSumreview2() {
		return sumreview2;
	}
	public void setSumreview2(String sumreview2) {
		this.sumreview2 = sumreview2;
	}
	public String getUsername2() {
		return username2;
	}
	public void setUsername(String username2) {
		this.username2 = username2;
	}
	public String getStoreaddr2() {
		return storeaddr2;
	}
	public void setStoreaddr2(String storeaddr2) {
		this.storeaddr2 = storeaddr2;
	}
	public int getSaleprice2() {
		return saleprice2;
	}
	public void setSaleprice2(int saleprice2) {
		this.saleprice2 = saleprice2;
	}
	public String getSalestart2() {
		return salestart2;
	}
	public void setSalestart2(String salestart2) {
		try {
			Date todaytimeee2 = today.parse(salestart2);
			if(now.getTime() <= todaytimeee2.getTime()) {
				this.salestart2 = "1";
			}else{
				this.salestart2 = salestart2;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getSalefinish2() {
		return salefinish2;
	}
	public void setSalefinish2(String salefinish2) {
		try {
			Date todaytimeee2 = today.parse(salefinish2);
			if(now.getTime() >= todaytimeee2.getTime()) {
				this.salefinish2 = "1";
			}else{
				this.salefinish2 = salefinish2;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public int getProprice2() {
		return proprice2;
	}
	public void setProprice2(int proprice2) {
		this.proprice2 = proprice2;
	}
}
