package com.beetmall.sshj.seller.vo;

public class SellerAskManagementVO {
	private int qnum; // 문의글번호
	private int productnum;//상품번호
	private String userid;//유저아이디
	private String qtitle;//제목
	private String qcontent;//작성내용
	private String qwritedate;//작성일
	private String qopen; //공개,비공개 여부
	private String qanswer; // 판매자 답변
	
	
	private String productname; // 상품 - 상품명
	private int totalAsk; // 문의 총 갯수
	private int nullAsk; // 미답변 문의 갯수
	private int newAsk; // 새 문의 갯수
	
	private String startDate; // 시작날짜
	private String endDate; // 종료날짜
	private String searchTxt; // 검색어
	private int[] mcatenumDataArr; // mcatenum 배열
	
	private int sortStr; // 정렬기준
	private String sellerId; // sellerid를 저장할 vo
	private String reportReason; //신고사유 받을 vo
	private String reportContent; //신고 내용 받을 vo
	
	///////////////////////////////////////////////////////////////////////////
	
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
	

	///////////////////////////////// 페이징 ////////////////////////////////////

	
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	
	
	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
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
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQwritedate() {
		return qwritedate;
	}
	public void setQwritedate(String qwritedate) {
		this.qwritedate = qwritedate;
	}
	public String getQopen() {
		return qopen;
	}
	public void setQopen(String qopen) {
		this.qopen = qopen;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getTotalAsk() {
		return totalAsk;
	}
	public void setTotalAsk(int totalAsk) {
		this.totalAsk = totalAsk;
	}
	public int getNullAsk() {
		return nullAsk;
	}
	public void setNullAsk(int nullAsk) {
		this.nullAsk = nullAsk;
	}
	public int getNewAsk() {
		return newAsk;
	}
	public void setNewAsk(int newAsk) {
		this.newAsk = newAsk;
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
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	public int[] getMcatenumDataArr() {
		return mcatenumDataArr;
	}
	public void setMcatenumDataArr(int[] mcatenumDataArr) {
		this.mcatenumDataArr = mcatenumDataArr;
	}
	public int getSortStr() {
		return sortStr;
	}
	public void setSortStr(int sortStr) {
		this.sortStr = sortStr;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	
}
