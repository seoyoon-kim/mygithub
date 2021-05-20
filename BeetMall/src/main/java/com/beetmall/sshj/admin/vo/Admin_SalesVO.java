package com.beetmall.sshj.admin.vo;

public class Admin_SalesVO {
	private String categoryCalendar_start; // 날짜 시작일
	private String categoryCalendar_end; // 날짜 종료일
	private String categoryDate; // 카테고리 날짜 (년도, 월별, 일별)
	private String accumulate; // 누적수익 체크박스
	private String company; // 회사수익 체크박스
	private String seller; // 판매자 수익 체크박스
	private String customer; // 구매 추이 체크박스
	
	private String startDate; //시작날짜
	private String endDate; //종료날짜
	
	private long acPay; // (누적수익)
	private long coPay; // (회사수익)
	private long sePay; // (판매자수익)
	private long cuPay; // (구매추이)
	
	
	
	
	
	
	public String getCategoryCalendar_start() {
		return categoryCalendar_start;
	}
	public void setCategoryCalendar_start(String categoryCalendar_start) {
		this.categoryCalendar_start = categoryCalendar_start;
	}
	public String getCategoryCalendar_end() {
		return categoryCalendar_end;
	}
	public void setCategoryCalendar_end(String categoryCalendar_end) {
		this.categoryCalendar_end = categoryCalendar_end;
	}
	public String getCategoryDate() {
		return categoryDate;
	}
	public void setCategoryDate(String categoryDate) {
		this.categoryDate = categoryDate;
	}
	public String getAccumulate() {
		return accumulate;
	}
	public void setAccumulate(String accumulate) {
		this.accumulate = accumulate;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public long getAcPay() {
		return acPay;
	}
	public void setAcPay(long acPay) {
		this.acPay = acPay;
	}
	public long getCoPay() {
		return coPay;
	}
	public void setCoPay(long coPay) {
		this.coPay = coPay;
	}
	public long getSePay() {
		return sePay;
	}
	public void setSePay(long sePay) {
		this.sePay = sePay;
	}
	public long getCuPay() {
		return cuPay;
	}
	public void setCuPay(long cuPay) {
		this.cuPay = cuPay;
	}
	
	
	
	
	
}
