package com.beetmall.sshj.custom.dao;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;

public interface MemberDAO {
	public int regiFinishiOk(MemberVO vo);	// 회원가입 완료
	public int idOverlap(String userid);	// 아이디 중복검사
	public MemberVO loginOk(String userid, String userpwd);	// 로그인
	public String infoSelect(String infoname);	// 약관조회
	public int sellerRegiFinishiOk(SellerMemberVO svo);
	public int farmInsert(CategoryFarmVO cvo);
}
