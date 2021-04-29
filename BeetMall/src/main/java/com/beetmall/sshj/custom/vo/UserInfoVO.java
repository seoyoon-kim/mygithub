package com.beetmall.sshj.custom.vo;

//회사소개, 이용약관, 개인정보처리방침
public class UserInfoVO {
	private String userinfotitle;
	private String userinfocontent;
	
	public String getUserinfotitle() {
		return userinfotitle;
	}
	public void setUserinfotitle(String userinfotitle) {
		this.userinfotitle = userinfotitle;
	}
	public String getUserinfocontent() {
		return userinfocontent;
	}
	public void setUserinfocontent(String userinfocontent) {
		this.userinfocontent = userinfocontent;
	}
}
