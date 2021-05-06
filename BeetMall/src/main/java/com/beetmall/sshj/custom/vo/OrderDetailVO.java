package com.beetmall.sshj.custom.vo;

public class OrderDetailVO {
	private int productnum;
	private int ordernum;
	private int orderquantity;
	private String orderstatus;
	private String orderconfirm;
	private int orderprice;
	private String settlecheck;
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getOrderconfirm() {
		return orderconfirm;
	}
	public void setOrderconfirm(String orderconfirm) {
		this.orderconfirm = orderconfirm;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getSettlecheck() {
		return settlecheck;
	}
	public void setSettlecheck(String settlecheck) {
		this.settlecheck = settlecheck;
	}
}
