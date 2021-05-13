package com.beetmall.sshj.custom.vo;

public class ClaimVO {
	private int ordernum;
	private int productnum;
	private String claimkind;
	private String claimstatus;
	private String claimcontent;
	private String claimdate;
	private String delivery;
	private long invoice;
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
	public String getClaimkind() {
		return claimkind;
	}
	public void setClaimkind(String claimkind) {
		this.claimkind = claimkind;
	}
	public String getClaimstatus() {
		return claimstatus;
	}
	public void setClaimstatus(String claimstatus) {
		this.claimstatus = claimstatus;
	}
	public String getClaimcontent() {
		return claimcontent;
	}
	public void setClaimcontent(String claimcontent) {
		this.claimcontent = claimcontent;
	}
	public String getClaimdate() {
		return claimdate;
	}
	public void setClaimdate(String claimdate) {
		this.claimdate = claimdate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public long getInvoice() {
		return invoice;
	}
	public void setInvoice(long invoice) {
		this.invoice = invoice;
	}
	
	
}
