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
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	private long totalMoney; // 정산금액 합계
	
	//페이징
	private int pageNum=1; // 현재 누른 페이지
	private int onePageNum=10; // 한페이지당 페이지 번호수
	private int onePageRecord=10; // 한페이지당 레코드 수
	
	private int totalPage; //총 페이지, lastPage 마지막 페이지
	private int totalRecord; //총 레코드수
	private int startPageNum=1; //시작페이지
	
	private int lastPageRecord=10; //마지막 페이지의 남은 레코드수
	
	
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// 시작페이지 번호 계산
		startPageNum = ((pageNum-1)/onePageNum*onePageNum)+1;
	}
	public int getOnePageNum() {
		return onePageNum;
	}
	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 레코드수를 이용하여 총페이지수를 구한다.
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		
		//마지막 페이지 레코드 수
		if(totalRecord%onePageRecord == 0) { // totalRecord % 10 == 0 이면 한페이지당 갯수가 딱 맞다는 것이다.
			lastPageRecord = onePageRecord; // 그렇기 때문에 onePageRecord 10을 lastPageRecord로 넣어주면 되고
		} else {
			lastPageRecord = totalRecord%onePageRecord; // 나머지가 있다면, 그 숫자가 마지막 페이지의 record 수가 된다.
		}
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getLastPageRecord() {
		return lastPageRecord;
	}
	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
	public long getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(long totalMoney) {
		this.totalMoney = totalMoney;
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
