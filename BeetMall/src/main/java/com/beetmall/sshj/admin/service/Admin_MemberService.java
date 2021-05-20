package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.Admin_MemberVO;
import com.beetmall.sshj.admin.vo.Admin_Member_PageVO;
import com.beetmall.sshj.admin.vo.Admin_PointVO;
import com.beetmall.sshj.admin.vo.Admin_WishVO;
import com.beetmall.sshj.admin.vo.Admin_farmVO;

public interface Admin_MemberService {
	public int memberCountall(int usertype);	// 모든 회원 정보(탈퇴 제외)
	public List<Admin_MemberVO> memberselectall(Admin_Member_PageVO pageVO);
	public int memberCount(int usertype, int seltype); // 특정조건 회원 정보(탈퇴, 구매, 판매 등으로 나누는 것)
	public List<Admin_MemberVO> memberselect(Admin_Member_PageVO pageVO);
	public int memberCountBlack(int usertype, int seltype);	// 블랙회원 정보
	public List<Admin_MemberVO> memberselectblack(Admin_Member_PageVO pageVO);
	public int memberCountSeller(int usertype, int seltype);	// 판매자 정보
	public List<Admin_MemberVO> memberselectSeller(Admin_Member_PageVO pageVO);
	public List<Admin_MemberVO> memberselectSellerAll(Admin_Member_PageVO pageVO);
	// 회원정보 부분
	public Admin_MemberVO memberinfoSelect(String userid);
	public List<Admin_MemberVO> orderinfoSelect(String userid);
	public Admin_MemberVO reportinfoSelect(String userid);
	public int orderstatusSelect(String userid, String status);
	public int memberEdit(Admin_MemberVO vo);
	// 포인트 부분
	public List<Admin_PointVO> selectPoint(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointType(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointMonth(Admin_Member_PageVO vo);
	public List<Admin_PointVO> selectPointTypeMonth(Admin_Member_PageVO vo);
	public int countPoint(String userid);
	public int countPointType(String userid, String type);
	public int countPointMonth(String userid, int month);
	public int countPointTypeMonth(String userid, String type, int month);
	public int myPointView(String userid);
	// 농장 부분
	public int farmCount(String userid);
	public List<Admin_farmVO> farmFavoriteList(Admin_Member_PageVO pageVO);
	// 장바구니 부분
	public int wishCount(String userid);
	public List<Admin_WishVO> wishListSelect(Admin_Member_PageVO pageVO);
}
