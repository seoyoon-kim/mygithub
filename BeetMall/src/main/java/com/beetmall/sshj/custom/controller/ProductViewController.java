package com.beetmall.sshj.custom.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.ProductViewServiceImp;
import com.beetmall.sshj.custom.vo.PageProductVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;
import com.beetmall.sshj.custom.vo.ProductViewVO;


@Controller
public class ProductViewController {

	
	@Inject ProductViewServiceImp productViewService;
	
	
	////////////////productView///////////////////
	
	@RequestMapping("/customproduct")
	@ResponseBody
	public ModelAndView ProductViewSelect(int productnum,HttpServletRequest req,PageProductVO pageVO,HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
       
		//테이블이 product/들어가는 수: productnum int/나오는 값 1개
		//sellfinish,thumbimg,productname,productprice,selloption,sellweight,
		//deliveryoption,origin,wrapping
		PageProductVO pageVO1=new PageProductVO();
		pageVO1.setProductnum(productnum);
		
		PageProductVO pageVO2=new PageProductVO();
		pageVO2.setProductnum(productnum);
		
		mav.addObject("pvo",productViewService.ProductViewSelect(productnum)); ///상품가격 여기서 구함
		mav.addObject("fvo",productViewService.ProductViewSelectFarm(productnum));
		mav.addObject("ovo",productViewService.ProductViewSelectoption(productnum));
		
		//상품의 할인가격 구하기	-->${Dprice}가 마이너스 되는 가격임	
		
		mav.addObject("Dprice",productViewService.PDprice(productnum)); 
		
	
		//System.out.println(productViewService.PDprice(productnum)); //출력됨
		

		
		//페이지
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("rpageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			pageVO1.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		
		String reqPageNum2 = req.getParameter("fpageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum2 != null) {
			pageVO2.setPageNum(Integer.parseInt(reqPageNum2)); 
		}


		//검색어와 검색키가 있을 때,
		//sapvo.setSearchWord(sapvo.getSearchWord());
		//sapvo.setSearchKey(sapvo.getSearchKey());
		//총 레코드 수 구하기 
		pageVO1.setTotalRecord(productViewService.totalRecord(pageVO1));
		System.out.println("totalrecord ->" +  productViewService.totalRecord(pageVO1)); //여기까지 나옴
		
		pageVO2.setTotalRecord(productViewService.totalRecord(pageVO2));
		System.out.println("totalrecord2 ->" +  productViewService.totalRecord2(pageVO2)); //여기까지 나옴
				
		//상품후기 구하기
		mav.addObject("reviewlist",productViewService.ProductViewReview(pageVO1));
	
		
	
		//문의내역 구하기
		mav.addObject("faqlist",productViewService.ProductViewFaq(pageVO2));
		
		mav.addObject("pageVO",pageVO1);
		mav.addObject("pageVO2",pageVO2);
		System.out.println("페이지 나옴 마지막 페이지"+pageVO1.getLastPageRecord());
		System.out.println("페이지 나옴 첫페이지 숫자"+pageVO1.getOnePageNum());
		System.out.println("페이지 나옴 전체페이지 숫자"+pageVO1.getTotalPage());
		
		
		//구한것들 뷰페이지로 가지고 이동
		mav.setViewName("custom/customproduct");
		
		return mav;
	}
	
	
  ////////////////리뷰 팝업창///////////////////
	
	@RequestMapping("reviewViewSelect")
	@ResponseBody
	public ProductViewVO reviewViewSelect(int pnum,int rnum) {
		System.out.println(pnum+"//"+rnum);
		
		ProductViewVO rvov = productViewService.reviewViewSelect(pnum,rnum);
		System.out.println("요기까지 실행");
		return rvov;
	}
	
	//////////////상품장바구니 페이지////////////////
	@RequestMapping("customWishInsert")
	@ResponseBody
	public String customWishInsert(HttpServletRequest req,HttpSession session) {
		String id = (String)session.getAttribute("logId");
		int productnum= Integer.parseInt(req.getParameter("productnum"));		
		int optnum=Integer.parseInt(req.getParameter("optnum"));
		int pcount=Integer.parseInt(req.getParameter("pcount"));
		int ocount=Integer.parseInt(req.getParameter("ocount"));
		System.out.println(id);
		System.out.println(productnum);
		System.out.println(pcount);
		System.out.println(optnum);
		System.out.println(ocount); //다 나오는거 확인함//넣기만 하면됨 
		//System.out.println(productViewService.customWishInsert());
		System.out.println(productViewService.customWishInsert(id,productnum,optnum,pcount,ocount));
		
		return id+","+productnum+","+optnum+","+pcount+","+ocount;
				
	}
	
	//////////////////상품 장바구니 열람///////////////
	@RequestMapping("customWish")
	@ResponseBody
	public ModelAndView customWishView(HttpSession session,HttpServletRequest req,PageProductVO pageVO,HttpServletResponse res){
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		
		
		PageProductVO pageVO1=new PageProductVO();
		pageVO1.setUserid(userid);
		
	//페이지
			//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
			String reqPageNum = req.getParameter("wpageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
			
			if(reqPageNum == null) {
				pageVO.setPageNum(1);
			}else if(reqPageNum != null) {
				pageVO.setPageNum(Integer.parseInt(reqPageNum));
			}
			
			//총 레코드 수 구하기 
			pageVO1.setTotalRecord(productViewService.totalRecord(pageVO1));
			//System.out.println("totalrecord ->" +  productViewService.totalRecord(pageVO1)); //여기까지 나옴
			mav.addObject("pageVO1", pageVO1);
				
			///장바구니 내역 구하기
			mav.addObject("wlist",productViewService.customWishView(pageVO1));
			mav.setViewName("custom/customWish");
			return mav;
	}
	
	
	
	
}
