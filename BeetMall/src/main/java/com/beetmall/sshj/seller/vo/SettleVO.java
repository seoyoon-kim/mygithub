package com.beetmall.sshj.seller.vo;

public class SettleVO {
	private String userid; //아이디
	private int ordernum; // 주문번호
	private int productnum; // 상품번호
	private String orderdate; // 주문일
	private long orderprice; //주문금액
	private long realpayment; // 실결제금액
	private String settledate; // 정산날짜
	private String settlecheck; //정산유무
	private String startDate;
	private String endDate;
	
	
	
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public long getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(long orderprice) {
		this.orderprice = orderprice;
	}
	public long getRealpayment() {
		return realpayment;
	}
	public void setRealpayment(long realpayment) {
		this.realpayment = realpayment;
	}
	public String getSettledate() {
		return settledate;
	}
	public void setSettledate(String settledate) {
		this.settledate = settledate;
	}
	public String getSettlecheck() {
		return settlecheck;
	}
	public void setSettlecheck(String settlecheck) {
		this.settlecheck = settlecheck;
	}
	
	
	
}
