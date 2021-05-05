package com.beetmall.sshj.custom.service;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;

public interface MemberService {
	public int regiFinishiOk(MemberVO vo);
	public int idOverlap(String userid);
	public MemberVO loginOk(String userid, String userpwd);
	public String infoSelect(String infoname);
	public int sellerRegiFinishiOk(SellerMemberVO svo);
	public int farmInsert(CategoryFarmVO cvo);
}
