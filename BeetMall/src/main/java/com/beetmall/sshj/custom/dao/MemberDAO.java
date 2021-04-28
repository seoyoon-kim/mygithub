package com.beetmall.sshj.custom.dao;

import com.beetmall.sshj.custom.vo.MemberVO;

public interface MemberDAO {
	public int regiFinishiOk(MemberVO vo);	// 회원가입 완료
	public int idOverlap(String userid);	// 아이디 중복검사
	public MemberVO loginOk(String userid, String userpwd);	// 로그인
	
}
