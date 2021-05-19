package com.beetmall.sshj.custom.vo;

public class NoticeVO {
	private int infonum;
	private String infotitle;
	private String infocontent;
	private String infowritedate;
	private int infohit;
	private String infotype;
	private String infoattach;
	
	//공지사항에서필요
	//이전글 다음글
	private int prevNo;//이전글번호
	private String prevSubject;//이전글제목
	private int nextNo;//다음글번호
	private String nextSubject;//다음글제목
	
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
	public int getPrevNo() {
		return prevNo;
	}
	public void setPrevNo(int prevNo) {
		this.prevNo = prevNo;
	}
	public String getPrevSubject() {
		return prevSubject;
	}
	public void setPrevSubject(String prevSubject) {
		this.prevSubject = prevSubject;
	}
	public int getNextNo() {
		return nextNo;
	}
	public void setNextNo(int nextNo) {
		this.nextNo = nextNo;
	}
	public String getNextSubject() {
		return nextSubject;
	}
	public void setNextSubject(String nextSubject) {
		this.nextSubject = nextSubject;
	}
}
