package com.beetmall.sshj.custom.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CategoryVO {
	//상품 product
	private String productnum;//상품번호
	private String productname;//상품이름
	private int productprice;//상품가격
	private String thumbimg;//이미지
	private int proprice;//실가격
	
	//리뷰
	private String totalscore; //별점
	private String sumreview; //리뷰총갯수
	
	//회원
	private String username;//판매자 이름
	
	//판매자
	private String storeaddr;//판매자 주소 
	
	//할인
	private int saleprice; //할인액
	private String salestart;//할인시작일
	private String salefinish;//할인끝나는날
	
	//베스트 상품떄문에 필요한 칼럼
	private int ordernum; //구매량
	
	//이름떄문에 필요한칼럼
	private String farmname; //농장이름
	
	//날짜함수
	SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = new Date();
	
	public String getProductnum() {
		return productnum;
	}
	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(String totalscore) {
		totalscore = totalscore.substring(0, 1);
		this.totalscore = totalscore;
	}
	public String getSumreview() {
		return sumreview;
	}
	public void setSumreview(String sumreview) {
		this.sumreview = sumreview;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getSalestart() {
		return salestart;
	}
	public void setSalestart(String salestart) {
		try {
			Date todaytimeee = today.parse(salestart);
			if(now.getTime() <= todaytimeee.getTime()) {
				this.salestart = "1";
			}else{
				this.salestart = salestart;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getSalefinish() {
		return salefinish;
	}
	public void setSalefinish(String salefinish) {
		try {
			Date todaytimeee = today.parse(salefinish);
			if(now.getTime() >= todaytimeee.getTime()) {
				this.salefinish = "1";
			}else{
				this.salefinish = salefinish;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public int getProprice() {
		return proprice;
	}
	public void setProprice(int proprice) {
		this.proprice = proprice;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getFarmname() {
		return farmname;
	}
	public void setFarmname(String farmname) {
		this.farmname = farmname;
	}
}
