package com.beetmall.sshj.admin.vo;

public class Admin_MemberVO {
	// -- 구매자쪽 -- //
	private String userid;
	private String userpwd;
	private String username;
	private String userphone;
	private String useremail;
	private int userzipcode;
	private String useraddr;
	private String userdetailaddr;
	private String birthday;
	private String joindate;
	private int usertype;
	private String userstop;
	private int point;
	private int age;
	// -- 이하 판매자쪽 -- //
	private int storenum;
	private String storename;
	private String sellername;
	private int sellerreginum;
	private String sellerregiimg;
	private int regiapproval;
	private String regiapprovaldate;
	private int storezipcode;
	private String storeaddr;
	private String storedetailaddr;
	private String storeemail;
	private String bank;
	private String bankname;
	private long bankaccount;
	// -- 회원정보 수정때문에 추가한 부분 //
	private int ordercount;
	private String orderstatus;
	
	private int reportcount;
	private int reportsum;
	
	// -- 탈퇴회원 부분 //
	private String exitdate;
	
	public String getExitdate() {
		return exitdate;
	}
	public void setExitdate(String exitdate) {
		this.exitdate = exitdate;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getReportcount() {
		return reportcount;
	}
	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	public int getReportsum() {
		return reportsum;
	}
	public void setReportsum(int reportsum) {
		this.reportsum = reportsum;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	public int getSellerreginum() {
		return sellerreginum;
	}
	public void setSellerreginum(int sellerreginum) {
		this.sellerreginum = sellerreginum;
	}
	public String getSellerregiimg() {
		return sellerregiimg;
	}
	public void setSellerregiimg(String sellerregiimg) {
		this.sellerregiimg = sellerregiimg;
	}
	public int getRegiapproval() {
		return regiapproval;
	}
	public void setRegiapproval(int regiapproval) {
		this.regiapproval = regiapproval;
	}
	public String getRegiapprovaldate() {
		return regiapprovaldate;
	}
	public void setRegiapprovaldate(String regiapprovaldate) {
		this.regiapprovaldate = regiapprovaldate;
	}
	public int getStorezipcode() {
		return storezipcode;
	}
	public void setStorezipcode(int storezipcode) {
		this.storezipcode = storezipcode;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
	public String getStoredetailaddr() {
		return storedetailaddr;
	}
	public void setStoredetailaddr(String storedetailaddr) {
		this.storedetailaddr = storedetailaddr;
	}
	public String getStoreemail() {
		return storeemail;
	}
	public void setStoreemail(String storeemail) {
		this.storeemail = storeemail;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public long getBankaccount() {
		return bankaccount;
	}
	public void setBankaccount(long bankaccount) {
		this.bankaccount = bankaccount;
	}
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public int getUserzipcode() {
		return userzipcode;
	}
	public void setUserzipcode(int userzipcode) {
		this.userzipcode = userzipcode;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUserdetailaddr() {
		return userdetailaddr;
	}
	public void setUserdetailaddr(String userdetailaddr) {
		this.userdetailaddr = userdetailaddr;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getUserstop() {
		return userstop;
	}
	public void setUserstop(String userstop) {
		this.userstop = userstop;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	

}
