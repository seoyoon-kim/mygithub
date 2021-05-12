package com.beetmall.sshj.seller.vo;

public class SellerNoticeVO {
	//notice 공지사항
	private int infonum; //글번호
	private String infotitle; //제목
	private String infocontent; //내용
	private String infowritedate; //등록일
	private int infohit; //조회수
	private String infotype; //판매자 소비자 구분 1, 소비자, 2.판매자
	private String infoattach; // 첨부파일
	public int getInfonum() {
		return infonum;
	}
	public void setInfonum(int infonum) {
		this.infonum = infonum;
	}
	public String getInfotitle() {
		return infotitle;
	}
	public void setInfotitle(String infotitle) {
		this.infotitle = infotitle;
	}
	public String getInfocontent() {
		return infocontent;
	}
	public void setInfocontent(String infocontent) {
		this.infocontent = infocontent;
	}
	public String getInfowritedate() {
		return infowritedate;
	}
	public void setInfowritedate(String infowritedate) {
		this.infowritedate = infowritedate;
	}
	public int getInfohit() {
		return infohit;
	}
	public void setInfohit(int infohit) {
		this.infohit = infohit;
	}
	public String getInfotype() {
		return infotype;
	}
	public void setInfotype(String infotype) {
		this.infotype = infotype;
	}
	public String getInfoattach() {
		return infoattach;
	}
	public void setInfoattach(String infoattach) {
		this.infoattach = infoattach;
	}
	
	
}
