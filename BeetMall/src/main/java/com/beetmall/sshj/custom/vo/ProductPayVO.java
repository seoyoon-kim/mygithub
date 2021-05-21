package com.beetmall.sshj.custom.vo;

public class ProductPayVO {
	//페이지 시작할때 필요한것
	private String username; 
	private String useremail; 
	private String userphone;
	private String useraddr;
	private String userdetailaddr;
	private int userzipcode;
	private int point;
	
	//값받아올것 떄문에 만든것
	private int total; //총가격
	private int discountprice; //총할인가격
	private int productnum; //상품번호
 	private String userid; //유저아이디
 	private int deliveryprice; //배송비
 	private String productname; //상품이름
 	
 	//order테이블에 넣기위해
 	private String receiver;
 	private String receiverphone;
 	private int deliveryzipcode;
 	private String deliveryaddr;
 	private String deliverydetailaddr;
 	private String deliverymemo;
 	private int deliveryoption;
 	private long ordernum;
 	private int orderprice;
 	private int usedpoint;
 	private int realpayment;
 	
 	private int optionnum;
 	private int orderquantity;
 	//
 	
 	//포인트
 	private int changepoint;
 	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
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
	public int getUserzipcode() {
		return userzipcode;
	}
	public void setUserzipcode(int userzipcode) {
		this.userzipcode = userzipcode;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getDiscountprice() {
		return discountprice;
	}
	public void setDiscountprice(int discountprice) {
		this.discountprice = discountprice;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getDeliveryprice() {
		return deliveryprice;
	}
	public void setDeliveryprice(int deliveryprice) {
		this.deliveryprice = deliveryprice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiverphone() {
		return receiverphone;
	}
	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}
	public int getDeliveryzipcode() {
		return deliveryzipcode;
	}
	public void setDeliveryzipcode(int deliveryzipcode) {
		this.deliveryzipcode = deliveryzipcode;
	}
	public String getDeliveryaddr() {
		return deliveryaddr;
	}
	public void setDeliveryaddr(String deliveryaddr) {
		this.deliveryaddr = deliveryaddr;
	}
	public String getDeliverydetailaddr() {
		return deliverydetailaddr;
	}
	public void setDeliverydetailaddr(String deliverydetailaddr) {
		this.deliverydetailaddr = deliverydetailaddr;
	}
	public String getDeliverymemo() {
		return deliverymemo;
	}
	public void setDeliverymemo(String deliverymemo) {
		this.deliverymemo = deliverymemo;
	}
	public int getDeliveryoption() {
		return deliveryoption;
	}
	public void setDeliveryoption(int deliveryoption) {
		this.deliveryoption = deliveryoption;
	}
	public long getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(long time1) {
		this.ordernum = time1;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public int getUsedpoint() {
		return usedpoint;
	}
	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
	}
	public int getRealpayment() {
		return realpayment;
	}
	public void setRealpayment(int realpayment) {
		this.realpayment = realpayment;
	}
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
	}
	public int getOrderquantity() {
		return orderquantity;
	}
	public void setOrderquantity(int orderquantity) {
		this.orderquantity = orderquantity;
	}
	public int getChangepoint() {
		return changepoint;
	}
	public void setChangepoint(int changepoint) {
		this.changepoint = changepoint;
	}
	
}
