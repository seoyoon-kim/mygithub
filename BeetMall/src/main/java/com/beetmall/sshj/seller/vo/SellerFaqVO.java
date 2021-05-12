package com.beetmall.sshj.seller.vo;

public class SellerFaqVO {
	//faq 자주묻는질문
	private int faqnum; //글번호
	private String faqcate; //카테고리
	private String faqtitle; //제목
	private String faqcontent; //내용
	private String faqoption; //소비자1, 판매자2 구분
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
