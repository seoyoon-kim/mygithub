package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.Admin_MemberDAO;
import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;

@Service
public class Admin_MemberServiceImp implements Admin_MemberService {

	@Inject
	Admin_MemberDAO memberdao;

	@Override
	public int memberCount(int usertype, int seltype) {
		return memberdao.memberCount(usertype, seltype);
	}

	@Override
	public List<Admin_MemberVO> memberselect(Admin_Member_PageVO pageVO) {
		return memberdao.memberselect(pageVO);
	}

	@Override
	public int memberCountBlack(int usertype, int seltype) {
		return memberdao.memberCountBlack(usertype, seltype);
	}

	@Override
	public List<Admin_MemberVO> memberselectblack(Admin_Member_PageVO pageVO) {
		return memberdao.memberselectblack(pageVO);
	}

	@Override
	public int memberCountall(int usertype) {
		return memberdao.memberCountall(usertype);
	}

	@Override
	public List<Admin_MemberVO> memberselectall(Admin_Member_PageVO pageVO) {
		return memberdao.memberselectall(pageVO);
	}

	@Override
	public int memberCountSeller(int usertype, int seltype) {
		return memberdao.memberCountSeller(usertype, seltype);
	}

	@Override
	public List<Admin_MemberVO> memberselectSeller(Admin_Member_PageVO pageVO) {
		return memberdao.memberselectSeller(pageVO);
	}

	@Override
	public Admin_MemberVO memberinfoSelect(String userid) {
		return memberdao.memberinfoSelect(userid);
	}

	@Override
	public List<Admin_MemberVO> orderinfoSelect(String userid) {
		return memberdao.orderinfoSelect(userid);
	}

	@Override
	public Admin_MemberVO reportinfoSelect(String userid) {
		return memberdao.reportinfoSelect(userid);
	}

	@Override
	public int orderstatusSelect(String userid, String status) {
		return memberdao.orderstatusSelect(userid, status);
	}

}
