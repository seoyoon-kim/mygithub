package com.beetmall.sshj.vo;

public class FarmVO {
	// 카테고리 대분류
	private int catenum;
	private String catename;
	private int catesort;
	private String cateimg;
	
	// 카테고리 중분류
	private int mcatenum;
	private String mcatename;
	private int mcatesort;
	
	
	
	public int getCatenum() {
		return catenum;
	}
	public void setCatenum(int catenum) {
		this.catenum = catenum;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public int getCatesort() {
		return catesort;
	}
	public void setCatesort(int catesort) {
		this.catesort = catesort;
	}
	public String getCateimg() {
		return cateimg;
	}
	public void setCateimg(String cateimg) {
		this.cateimg = cateimg;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getMcatename() {
		return mcatename;
	}
	public void setMcatename(String mcatename) {
		this.mcatename = mcatename;
	}
	public int getMcatesort() {
		return mcatesort;
	}
	public void setMcatesort(int mcatesort) {
		this.mcatesort = mcatesort;
	}
	
	
}
