package com.beetmall.sshj.seller.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.ProductService;
import com.beetmall.sshj.seller.vo.DiscountVO;
import com.beetmall.sshj.seller.vo.OptionVO;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;


@Controller
public class ProductController {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	com.beetmall.sshj.seller.service.FarmService farmService;
	@Autowired
	ProductService productService;
	
	//판매상품 목록
	  @RequestMapping("/product_list") 
	  public ModelAndView product_list(ProductVO vo, SearchAndPageVO spvo, HttpSession session) { 
		  
		  ModelAndView mav = new ModelAndView();
		  vo.setUserid((String)session.getAttribute("logId"));
		  mav.addObject("productList", productService.productAllSelect(vo.getUserid()));
			
		  if(spvo.getSearchWord()!=null) { //%% like 연산자
				//spvo.setSearchWord("%"+spvo.getSearchWord()+"%");
				spvo.setSearchWord(spvo.getSearchWord());
				mav.addObject("productList", productService.productAllSelect(vo.getUserid()));
				mav.addObject("productList", productService.searchList(spvo)); 
				System.out.println("word=" + spvo.getSearchWord());
		  }
		  
		  mav.setViewName("seller/product_list"); 
		  return mav; 
	  }
	
	//판매상품 삭제 시 진행중인 주문있으면 불가능
	
	//상품등록페이지 
	//판매 상품등록페이지 대분류,중분류 카테고리 불러오기
	@RequestMapping("/product_regi")
	public ModelAndView category_select() {
	ModelAndView mav = new ModelAndView();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",farmService.allCategoryList());		
		mav.setViewName("seller/product_regi");
		return mav;
	}
	
	//판매상품등록 (할인o, 옵션o)
	@RequestMapping("/transactionForm")
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public String frm() {
		return "seller/product_regi";
	}
	@RequestMapping(value="/product_regi_ok", method=RequestMethod.POST)
	public ModelAndView product_regi(ProductVO vo, HttpSession session, HttpServletRequest req, @RequestParam MultipartFile file) {
		//이미지 파일 변수
		String orgName = file.getOriginalFilename();
		String path = req.getSession().getServletContext().getRealPath("resources/sellerProductImgs");
		ModelAndView mav = new ModelAndView();
	
		//session userid
		vo.setUserid((String)session.getAttribute("logId"));
		
		//productVO가 insert될 때 함께 insert될 VO
		//할인
		DiscountVO dvo = new DiscountVO();
		//옵션
		OptionVO ovo = new OptionVO();
		//할인, 옵션 없는 productVO
		ProductVO pvo = new ProductVO();
		
		//[commit을 도와주는 객체 생성]
		//transaction 구현을 위한 객체생성
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		//매개변수가 정수, fieldsummary가 PROPAGATION_REQUIRED 기존에 있는 트랜젝션을 호출하여 int로 돌아온다 
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		//에러 안나면 commit
		TransactionStatus status = transactionManager.getTransaction(def); 
		//결과확인에서도 사용하기 위해 discountInsert, optionInsert 담는 변수 꺼내놓기
		int result2 = 0;
		int result3 = 0;
		
		try {
			//상품등록 
			int result = productService.productInsert(vo);
			
			//할인이 있을 때,
			if(vo.getSaleselect() == '1') {
				result2 = productService.discountInsert(dvo);
			}
			// 옵션이 있을 때, 
			if(vo.getOptionselect() == '1') {
				result3 = productService.optionInsert(ovo);
			}
			
			//-------------------이미지 등록 (파일 업로드)-------------------------
			String paramName = file.getName();

			try {
				if(orgName != null) {
					File f = new File(path, orgName);
					int i = 1;
					while(f.exists()) {
						int point = orgName.lastIndexOf(".");
						String name = orgName.substring(0, point);
						String extName = orgName.substring(point+1);
						
						f = new File(path, name+"_"+ i++ + "." + extName);
					}// while
					orgName = f.getName();
					
					try {
						file.transferTo(new File(path,orgName));
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			vo.setThumbimg(orgName);
			//----------------이미지 등록 끝-----------------------------
			
			//insert 결과 확인
			// 상품등록 확인
			if(result>0) {
				System.out.println("[상품 등록 완료]");
				mav.setViewName("redirect:product_list");
			}else {
				System.out.println("[상품 등록 실패 - 다시 확인해주세요.]");
				mav.setViewName("redirect:product_regi");
			}
			// 할인 적용 확인
			if(result2>0) {
				System.out.println("[할인 적용 완료]");
			}else {
				System.out.println("[할인 적용 실패 - 다시 확인해주세요.]");
			}
			// 옵션 상품 등록 확인 
			if(result3>0) {
				System.out.println("[옵션 상품 등록 완료]");
			}else {
				System.out.println("[옵션 상품등록 실패 - 다시 확인해주세요.]");
			}
			//정상 구현되면 commit 실행 (commit에 필요한 개체들은 상단에 미리 호출)
			transactionManager.commit(status); 
		}catch(Exception e){
			System.out.println("<<상품등록 트랜잭션 에러 발생>>");
			e.printStackTrace();
		}
		//mav.setViewName("redirect:product_list");
		return mav;
	}
	

	
	
	
	//판매자 주문관리
	@RequestMapping("/order_management")
	public String order_management() {
		return "seller/order_management";
	}
	//판매자 판매관리
	@RequestMapping("/sale_management")
	public String seller_management() {
		return "seller/sale_management";
	}
}
