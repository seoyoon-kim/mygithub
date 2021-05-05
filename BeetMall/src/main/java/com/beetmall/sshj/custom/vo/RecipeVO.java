package com.beetmall.sshj.custom.vo;

public class RecipeVO {

	private int recipenum;
	private String userid;
	private String recipetitle;
	private String recipecontent;
	private String recipemainimg;
	private String recipewritedate;
	private int reciperecommend;
	private int recipehit;
	
	private int faqnum;
	private String faqcate;
	private String faqtitle;
	private String faqcontent;
	private String faqoption;
	
	
	
	
	public int getRecipenum() {
		return recipenum;
	}
	public void setRecipenum(int recipenum) {
		this.recipenum = recipenum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRecipetitle() {
		return recipetitle;
	}
	public void setRecipetitle(String recipetitle) {
		this.recipetitle = recipetitle;
	}
	public String getRecipecontent() {
		return recipecontent;
	}
	public void setRecipecontent(String recipecontent) {
		this.recipecontent = recipecontent;
	}
	public String getRecipemainimg() {
		System.out.println(recipemainimg);
		return recipemainimg;
	}
	public void setRecipemainimg(String recipemainimg) {
		this.recipemainimg = recipemainimg;
	}
	public String getRecipewritedate() {
		return recipewritedate;
	}
	public void setRecipewritedate(String recipewritedate) {
		this.recipewritedate = recipewritedate;
	}
	public int getReciperecommend() {
		return reciperecommend;
	}
	public void setReciperecommend(int reciperecommend) {
		this.reciperecommend = reciperecommend;
	}
	public int getRecipehit() {
		return recipehit;
	}
	public void setRecipehit(int recipehit) {
		this.recipehit = recipehit;
	}
	
	public RecipeVO() {
		
	}
	
	
	
	
	public int getFaqnum() {
		return faqnum;
	}
	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}
	public String getFaqcate() {
		return faqcate;
	}
	public void setFaqcate(String faqcate) {
		this.faqcate = faqcate;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public String getFaqcontent() {
		return faqcontent;
	}
	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}
	public String getFaqoption() {
		return faqoption;
	}
	public void setFaqoption(String faqoption) {
		this.faqoption = faqoption;
	}
	
	
	
}
