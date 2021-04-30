package com.beetmall.sshj.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	
	@RequestMapping("/kangsan")
	public String kangsan() {
		return "custom/categoryMain";
	}
	
	@RequestMapping("/FAQBoard")
	public String FAQBoard() {
		return "custom/customerCenter/FAQBoard";
	}
	
	@RequestMapping("/mapping")
	public String mapping() {
		return "custom/mapList";
	}
	
	@RequestMapping("/kangsan2")
	public String kangsan2() {
		return "custom/uglyItem";
	}
	
	@RequestMapping("kangsan3")
	public String kangsan3() {
		return "custom/categoryCharge";
	}
	
	@RequestMapping("kangsan4")
	public String kangsan4() {
		return "custom/payCategory";
	}
	
	@RequestMapping("myfavoriForm")
	public String myfavoriForm() {
		return "mypages/myfavoriForm";
	}
	@RequestMapping("notice_view2")
	public String notice_view2() {
		return "custom/customerCenter/notice_view";
	}
	@RequestMapping("knotice_view")
	public String knotice_view() {
		return "custom/customerCenter/notice_view";
	}
	@RequestMapping("chargeAPI")
	public String chargeAPI() {
		return "mypages/chargeAPI";
	}
	
	
//	윤주///////////////////////////////////////////////////////////////
	
	@RequestMapping("recipeHome")
	public String recipeHome() {
		return "custom/recipeHome";
	}
/*	
	@RequestMapping("recipeView")
	public String recipeView() {
		return "custom/recipeView";
	}
	
	@RequestMapping("recipeWrite")
	public String recipeWrite() {
		return "custom/recipeWrite";
	}
*/	
	@RequestMapping("/custominfo")
	public String customInfo() {
		return "custom/custominfo";
	}

	@RequestMapping("/customWish")
	public String customWish() {
		return "custom/customWish";
	}
	
	@RequestMapping("/customBuyConfirm")
	public String customBuyConfirm() {
		return "custom/customBuyConfirm";
	}

	@RequestMapping("/customMyrecipe")
	public String customMyrecipe() {
		return "custom/customMyrecipe";
	}
	
	@RequestMapping("/customproduct")
	public String customproduct() {
		return "custom/customproduct";
	}
	
	@RequestMapping("/custompay")
	public String custompay() {
		return "custom/custompay";
	}


// 윤수///////////////////////////////////////////////////////////////
	@RequestMapping("error")	// 에러페이지
	public String errer() {
		return "etc/error";
	}
	@RequestMapping("searchId")
	public String searchId() {	// 아이디 찾기
		return "login/idSearch";	
	}
	@RequestMapping("searchPwd")
	public String searchPwd() {	// 비밀번호 찾기
		return "login/pwdSearch";	
	}

	@RequestMapping("infoView")
	public String infoView() {	// 약관조회
		return "info/infoView";
	}
	@RequestMapping("mypoint")
	public String myPoint() {	// 마이포인트
		return "mypages/mypoint";
	}
	@RequestMapping("myinfoEdit")
	public String myInfoEdit() {	// 내 정보
		return "mypages/myInfoEdit";
	}
	@RequestMapping("mybuyList")
	public String myBuyList() {	// 구매내역
		return "mypages/mybuyList";
	}
	@RequestMapping("myChatList")
	public String myChatList() {	// 채팅내역
		return "mypages/myChatList";
	}
	@RequestMapping("leaveMember")
	public String leaveMember() {	// 회원탈퇴
		return "mypages/leaveMember";
	}
	@RequestMapping("leaveMemberOk")
	public String leaveMemberSuccess() {	// 회원탈퇴 성공페이지
		return "mypages/leaveMemberSuccess";
	}
}
