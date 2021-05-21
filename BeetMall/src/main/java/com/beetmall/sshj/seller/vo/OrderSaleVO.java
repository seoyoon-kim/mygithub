package com.beetmall.sshj.seller.vo;

public class OrderSaleVO {
	//ordertbl
		public String ordernum; //주문번호
		public String sellerid; //판매자아이디
		public String userid; // 주문자 아이디
		public String orderdate; // 주문날짜 
		public String username; // 주문자명
		public String userphone; //전화번호
		public String orderprice; //주문금액
		public String orderoption; //주문방법(픽업or택배:?)
		public String receiver; // 받는사람
		public String receiverphone; //휴대폰번호
		public int deliveryzipcode; //우편번호
		public String deliveryaddr; //주소
		public String deliverydetailaddr;//상세주소
		public int deliveryprice;//배송비
		public String deliveryoption; //배송지명
		public String deliveryname;//배송지명
		public String deliverymemo;//배송요청사항
		public String paymentdate; //결제날짜
		public String paymentoption; //결제방법
		public int usedpoint;//사용한 마일리지
		public int realpayment; // 실결제금액
		public int realtotalpayment; //배송비포함실결제금액
		public int optionnum; //주문한 옵션 번호
		
		
	//orderdetail(구매목록 - productnum으로 연결)
		public int productnum; //상품번호 
		public int orderquantity; //수량
		public String orderstatus; //주문현재상황
		public String orderfirm; //구매확정날짜

	//product
		public String productname; //상품명
	//option
		public String optionname;
		public int optionprice;
	//discount
		public int saleprice;
		public int totalsaleprice; // saleprice * orderquantity 주문한 전체 상품에 대한 할인

	//delivery 
		public String deliverynum; //배송번호
		public String invoice; //송장번호
		public String deliverycompany; //택배사
		
	//deliverynow (배송현재상황)
		public String deliverystatus; //배송현재상황
		public String deliverydate; //날짜
	//claim
		public String claimkind; //클레임종류 (취소 0 반품 1)
		public String claimstatus; //클레임 상태
		public String claimContent; //클레임 내용
		public String claimdate; //클레임 날짜
		public String delivery; //배송???
		public String getOrdernum() {
			return ordernum;
		}
		public void setOrdernum(String ordernum) {
			this.ordernum = ordernum;
		}
		public String getSellerid() {
			return sellerid;
		}
		public void setSellerid(String sellerid) {
			this.sellerid = sellerid;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getOrderdate() {
			return orderdate;
		}
		public void setOrderdate(String orderdate) {
			this.orderdate = orderdate;
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
		public String getOrderprice() {
			return orderprice;
		}
		public void setOrderprice(String orderprice) {
			this.orderprice = orderprice;
		}
		public String getOrderoption() {
			return orderoption;
		}
		public void setOrderoption(String orderoption) {
			this.orderoption = orderoption;
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
		public int getDeliveryprice() {
			return deliveryprice;
		}
		public void setDeliveryprice(int deliveryprice) {
			this.deliveryprice = deliveryprice;
		}
		public String getDeliveryoption() {
			return deliveryoption;
		}
		public void setDeliveryoption(String deliveryoption) {
			this.deliveryoption = deliveryoption;
		}
		public String getDeliveryname() {
			return deliveryname;
		}
		public void setDeliveryname(String deliveryname) {
			this.deliveryname = deliveryname;
		}
		public String getDeliverymemo() {
			return deliverymemo;
		}
		public void setDeliverymemo(String deliverymemo) {
			this.deliverymemo = deliverymemo;
		}
		public String getPaymentdate() {
			return paymentdate;
		}
		public void setPaymentdate(String paymentdate) {
			this.paymentdate = paymentdate;
		}
		public String getPaymentoption() {
			return paymentoption;
		}
		public void setPaymentoption(String paymentoption) {
			this.paymentoption = paymentoption;
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
		public int getRealtotalpayment() {
			return realtotalpayment;
		}
		public void setRealtotalpayment(int realtotalpayment) {
			this.realtotalpayment = realtotalpayment;
		}
		public int getOptionnum() {
			return optionnum;
		}
		public void setOptionnum(int optionnum) {
			this.optionnum = optionnum;
		}
		public int getProductnum() {
			return productnum;
		}
		public void setProductnum(int productnum) {
			this.productnum = productnum;
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
		public String getOrderfirm() {
			return orderfirm;
		}
		public void setOrderfirm(String orderfirm) {
			this.orderfirm = orderfirm;
		}
		public String getProductname() {
			return productname;
		}
		public void setProductname(String productname) {
			this.productname = productname;
		}
		public String getOptionname() {
			return optionname;
		}
		public void setOptionname(String optionname) {
			this.optionname = optionname;
		}
		public int getOptionprice() {
			return optionprice;
		}
		public void setOptionprice(int optionprice) {
			this.optionprice = optionprice;
		}
		public int getSaleprice() {
			return saleprice;
		}
		public void setSaleprice(int saleprice) {
			this.saleprice = saleprice;
		}
		public int getTotalsaleprice() {
			return totalsaleprice;
		}
		public void setTotalsaleprice(int totalsaleprice) {
			this.totalsaleprice = totalsaleprice;
		}
		public String getDeliverynum() {
			return deliverynum;
		}
		public void setDeliverynum(String deliverynum) {
			this.deliverynum = deliverynum;
		}
		public String getInvoice() {
			return invoice;
		}
		public void setInvoice(String invoice) {
			this.invoice = invoice;
		}
		public String getDeliverycompany() {
			return deliverycompany;
		}
		public void setDeliverycompany(String deliverycompany) {
			this.deliverycompany = deliverycompany;
		}
		public String getDeliverystatus() {
			return deliverystatus;
		}
		public void setDeliverystatus(String deliverystatus) {
			this.deliverystatus = deliverystatus;
		}
		public String getDeliverydate() {
			return deliverydate;
		}
		public void setDeliverydate(String deliverydate) {
			this.deliverydate = deliverydate;
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
		public String getClaimContent() {
			return claimContent;
		}
		public void setClaimContent(String claimContent) {
			this.claimContent = claimContent;
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
		
	
		
}