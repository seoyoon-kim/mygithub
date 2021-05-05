package com.beetmall.sshj.custom.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.MemberDAO;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;
@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO memberDAO;

	@Override
	public int regiFinishiOk(MemberVO vo) {	//회원가입 완료
		return memberDAO.regiFinishiOk(vo);
	}

	@Override
	public int idOverlap(String userid) {
		
		return memberDAO.idOverlap(userid);
	}

	@Override
	public MemberVO loginOk(String userid, String userpwd) {
		
		return memberDAO.loginOk(userid, userpwd);
	}

	@Override
	public String infoSelect(String infoname) {
		
		return memberDAO.infoSelect(infoname);
	}

	@Override
	public int sellerRegiFinishiOk(SellerMemberVO svo) {
		
		return memberDAO.sellerRegiFinishiOk(svo);
	}

	@Override
	public int farmInsert(CategoryFarmVO cvo) {
		
		return memberDAO.farmInsert(cvo);
	}

}
