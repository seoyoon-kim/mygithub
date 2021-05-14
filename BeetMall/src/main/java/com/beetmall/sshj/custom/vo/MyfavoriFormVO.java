package com.beetmall.sshj.custom.vo;

public class MyfavoriFormVO {
	/*
	 * <img src="/sshj/img/${data.farmprofile}"><span
	 * class="buyttitle wordcut">${data.farmname}</span><span
	 * class="buydetail wordcut">${data.farmintro}</span> 172: </li> 173: <li><span
	 * class="favprice">${data.storeaddr}</span></li> 174: <li
	 * style="color: red;"><div class="like">${data.goodTotal}명</div></li>
	 */
	private int Storenum;
	private String farmprofile;
	private String farmname;
	private String farmintro;
	private int goodTotal;
	private String storeaddr;
	public int getStorenum() {
		return Storenum;
	}
	public void setStorenum(int storenum) {
		Storenum = storenum;
	}
	public String getFarmprofile() {
		return farmprofile;
	}
	public void setFarmprofile(String farmprofile) {
		this.farmprofile = farmprofile;
	}
	public String getFarmname() {
		return farmname;
	}
	public void setFarmname(String farmname) {
		this.farmname = farmname;
	}
	public String getFarmintro() {
		return farmintro;
	}
	public void setFarmintro(String farmintro) {
		this.farmintro = farmintro;
	}
	public int getGoodTotal() {
		return goodTotal;
	}
	public void setGoodTotal(int goodTotal) {
		this.goodTotal = goodTotal;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
	
	
}
