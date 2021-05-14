package com.beetmall.sshj.custom.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.ProductViewServiceImp;
import com.beetmall.sshj.custom.vo.ProductViewVO;


@Controller
public class ProductViewController {

	
	@Inject ProductViewServiceImp productViewService;
	
	
	////////////////productView///////////////////
	
	@RequestMapping("/customproduct")
	@ResponseBody
	public ModelAndView ProductViewSelect(int productnum,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
       
		//테이블이 product/들어가는 수: productnum int/나오는 값 1개
		//sellfinish,thumbimg,productname,productprice,selloption,sellweight,
		//deliveryoption,origin,wrapping
		
		mav.addObject("pvo",productViewService.ProductViewSelect(productnum)); ///상품가격 여기서 구함
		mav.addObject("fvo",productViewService.ProductViewSelectFarm(productnum));
		mav.addObject("ovo",productViewService.ProductViewSelectoption(productnum));
		
		//상품의 할인가격 구하기	-->${Dprice}가 마이너스 되는 가격임
		mav.addObject("Dprice",productViewService.PDprice(productnum)); 
		System.out.println(productViewService.PDprice(productnum)); //출력됨
		
		//상품의 옵션가격 구하기
		//System.out.println("옵션번호"+req.getAttribute("optionnum"));
		//mav.addObject("POprice",productViewService.POprice(productnum));
		/*String pnum=productViewService.POprice(productnum);
		if(pnum!=null){ //값이 있을경우
			
			mav.addObject("Pyesno","yes");
		}else { //값이 없을경우
			
			mav.addObject("Pyesno","no");
		}
	*/
		
		
		//상품후기 구하기
		mav.addObject("reviewlist",productViewService.ProductViewReview(productnum));
		
		
		
		
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
	
	
	
	
}
