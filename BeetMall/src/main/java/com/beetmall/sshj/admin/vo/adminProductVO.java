package com.beetmall.sshj.admin.vo;

public class adminProductVO {
	private int productnum;
	private int mcatenum;
	private String productname;
	private String storename;
	private String sellername;
	private int count;
	private String sellstart;
	
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public int getMcatenum() {
		return mcatenum;
	}
	public void setMcatenum(int mcatenum) {
		this.mcatenum = mcatenum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSellstart() {
		return sellstart;
	}
	public void setSellstart(String sellstart) {
		this.sellstart = sellstart;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}	
}
