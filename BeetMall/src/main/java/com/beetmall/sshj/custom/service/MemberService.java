package com.beetmall.sshj.custom.service;

import com.beetmall.sshj.custom.vo.MemberVO;

public interface MemberService {
	public int regiFinishiOk(MemberVO vo);
	public int idOverlap(String userid);
	public MemberVO loginOk(String userid, String userpwd);
	public String infoSelect(String infoname);
}
