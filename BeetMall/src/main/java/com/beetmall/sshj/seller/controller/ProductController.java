package com.beetmall.sshj.seller.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.beetmall.sshj.seller.service.ProductService;
import com.beetmall.sshj.seller.vo.OrderSaleVO;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;


@Controller
public class ProductController {
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	com.beetmall.sshj.seller.service.SellerSalesService farmService;
	@Autowired
	ProductService productService;

//====================================== 판매상품 목록 ===================================================
	  @RequestMapping("/product_list") 
	  public ModelAndView product_list(ProductVO vo, SearchAndPageVO sapvo, HttpSession session, HttpServletRequest req) { 
		//로그인한 아이디가져오기
		sapvo.setUserid((String)session.getAttribute("logId"));
			
		//리퀘스트했을 때, 페이지번호가 있으면 세팅/ 없으면 기본 값=1
		String reqPageNum = req.getParameter("pageNum"); //pageNum = 1로 sapvo에 이미 기본값 세팅이 되어 있음
		if(reqPageNum != null) {
			sapvo.setPageNum(Integer.parseInt(reqPageNum)); 
		}
		//검색어
		sapvo.setSearchWord(sapvo.getSearchWord());
		//총 레코드 수 구하기 
		sapvo.setTotalRecord(productService.totalRecord(sapvo));
		  
		ModelAndView mav = new ModelAndView();
		
		//상품목록 담기
		mav.addObject("productList", productService.productAllSelect(sapvo));
					
		//검색어와 페이징를 담기
		mav.addObject("searchWord",sapvo.getSearchWord());
		mav.addObject("sapvo",sapvo);
			
		mav.setViewName("seller/product_list"); 
		return mav; 
	  }

	
//====================================== 상품 등록 ===================================================
	//판매 상품등록페이지 대분류,중분류 카테고리 불러오기
	@RequestMapping("/product_regi")
	public ModelAndView category_select() {
	ModelAndView mav = new ModelAndView();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",farmService.allCategoryList());		
		mav.setViewName("seller/product_regi");
		return mav;
	}
	
	//판매상품등록 (할인, 옵션 transaction)

	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	@RequestMapping(value="/product_regi_ok", method=RequestMethod.POST)
	public ModelAndView product_regi(ProductVO vo, HttpSession session, HttpServletRequest req) {
		System.out.println("product_regi_ok까지는 넘어옴");
		//첨부파일 받아오기 
				MultipartHttpServletRequest multireq = (MultipartHttpServletRequest)req;
				MultipartFile file = multireq.getFile("file");
				System.out.println("multireq ->"+multireq);
				System.out.println("file -> "+file);
		//이미지 파일 변수
		String orgName = file.getOriginalFilename();
		System.out.println("orgName ->"+ orgName);
		String path = req.getSession().getServletContext().getRealPath("resources/sellerProductImgs");
		System.out.println("path ->"+ path);
		ModelAndView mav = new ModelAndView();
	
		//session userid
		vo.setUserid((String)session.getAttribute("logId"));
		
		
		System.out.println("컨트롤러 vo 통과");
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
	
//-----------------------이미지 등록 (파일 업로드)--------------------------------
			String paramName = file.getName();
			System.out.println(paramName + " - 업로드 과정");
			try {
				if(orgName != null) {
					System.out.println("이미지 업로드 try catch");
					File f = new File(path, orgName);
					int i = 1;
					while(f.exists()) {
						int point = orgName.lastIndexOf(".");
						String name = orgName.substring(0, point);
						String extName = orgName.substring(point+1);
						
						f = new File(path, name+"_"+ i++ + "." + extName);
						System.out.println("f->"+f);
					}// while
					orgName = f.getName();
						System.out.println("orgName->"+orgName);
					//vo.setThumbimg(orgName);
					try {
						file.transferTo(new File(path,orgName));
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			//추가하지 않으면 값을 지정해서 넣어준다. 
			vo.setThumbimg(orgName);
			System.out.println("vo에 set해주는 이미지 이름 orgName -> "+orgName);
			
//------------------------확인----------------------------------------------------
			
			System.out.println("확인");
			System.out.println("mcatenum -> "+ vo.getMcatenum());
			System.out.println("productname -> " +vo.getProductname());
			System.out.println("productprice -> " +vo.getProductprice());
			System.out.println("userid ->"+vo.getUserid());
			System.out.println("totalstock ->"+vo.getTotalstock());
			System.out.println("deliveryoption ->"+vo.getDeliveryoption());
			System.out.println("deliveryprice ->"+vo.getDeliveryprice());
			System.out.println("saleselect ->"+vo.getSaleselect());
			System.out.println("optionselect ->"+vo.getOptionselect());
			System.out.println("saleb -> "+ vo.getSaleb());
			System.out.println("sellstart ->"+vo.getSellstart());
			System.out.println("sellfinish ->"+vo.getSellfinish());
			System.out.println("saleprice ->"+vo.getSaleprice());
			System.out.println("productcontent ->"+vo.getProductcontent());
			System.out.println("origin ->" +vo.getOrigin());
			System.out.println("selloption->"+vo.getSelloption());
			System.out.println("sellWeight->"+vo.getSellweight());
			System.out.println("wrapping -> "+ vo.getWrapping());
			
			
//---------------------------insert & 조건-----------------------------------------		
			// 못난이 할인을 선택하지 않았을 때,
			if(vo.getSaleb()!='1' || vo.getSaleb()=='0') {
				vo.setSaleb('0');
			}
			//배송옵션이 0이면 나머지 다 0으로 세팅
			 if(vo.getDeliveryoption()=="1" || vo.getDeliveryoption().equals(1)) { 
				vo.setPaymentoption("0");
				vo.setDeliveryprice(0); 
			}			
			
			//상품등록 
			int result = productService.productInsert(vo);
			System.out.println("상품 insert -> "+ result);
		
			//할인선택이 있을 때, insert
			if(vo.getSaleselect() == '1' || vo.getSaleselect() == 1) {
				result2 = productService.discountInsert(vo);
				System.out.println("vo.getSaleSelect -> " + vo.getSaleselect());
				System.out.println("할인 insert +" + result2);
			}
			// 옵션선택이 있을 때, insert
			if(vo.getOptionselect() == '1' || vo.getOptionselect() == 1) {
				result3 = productService.optionInsert(vo);
				System.out.println("vo.getOpionSelect ->" + vo.getOptionselect());
				System.out.println("옵션 insert + "+ result3);
			}
			
			 
//---------------------------insert 결과 확인--------------------------------------
			// 상품등록 확인
			if(result>0) {
				System.out.println("[상품 등록 완료]");
				transactionManager.commit(status); 
				mav.setViewName("redirect:product_list");			
			}else {
				System.out.println("[상품 등록 실패 - 다시 확인해주세요.]");
				mav.setViewName("redirect:product_regi");
			}
			// 할인 적용 확인
			if(result2>0) {
				System.out.println("[할인 적용 완료]");
				transactionManager.commit(status); 
			}else {
				System.out.println("[할인 적용 실패 - 다시 확인해주세요.]");
			}
			// 옵션 상품 등록 확인 
			if(result3>0) {
				System.out.println("[옵션 상품 등록 완료]");
				transactionManager.commit(status); 
			}else {
				System.out.println("[옵션 상품등록 실패 - 다시 확인해주세요.]");
			}
//----------정상 구현되면 commit 실행 (commit에 필요한 개체들은 상단에 미리 호출)-----------------
			//transactionManager.commit(status); 
		}catch(Exception e){
			System.out.println("<<상품등록 트랜잭션 에러 발생>>");
			e.printStackTrace();
		}
		//mav.setViewName("redirect:product_list");
		return mav;
	}
	

	
//======================================판매상품 목록에서 삭제 ===================================================
	//판매상품 삭제 시 진행중인 주문있으면 불가능	
	@RequestMapping(value = "/productDelete" , method = {RequestMethod.GET, RequestMethod.POST})
	public String productDelete(@RequestParam(value="valueArr") List<Integer> delList , String oneProductcheck, HttpServletRequest req) {
		//ajax를 통해서 valArr에서 받은 delList를 하나씩 꺼내서 ArrayList에 넣음 
		ArrayList<Integer> delArr = new ArrayList<Integer>();	
		System.out.println("delList->"+delList);
		for(int i = 0; i< delList.size(); i++) {
			delArr.add(delList.get(i));
			System.out.println("delArr->"+ delArr);
		}
		// ArrayList로 담은 것을 Mapper로 보내기
		for( int i = 0;  i < delArr.size(); i++) {
			int productnum = delArr.get(i);
			System.out.println("delete productnum -> "+productnum);
			productService.productDelete(productnum);
		}

		return "redirect:product_list";
	}
	
//====================================== 수정 ===================================================
	//수정하기 뷰로 이동
	@RequestMapping("oneRecordSelect")
	public ModelAndView onePageRecordSelect(int productnum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("productnum", productService.onePageRecordSelect(productnum));
		mav.setViewName("seller/product_edit");
		return mav;
	}
	// 수정하기 
	@RequestMapping("/product_edit")
	public ModelAndView product_edit(OrderSaleVO osvo) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	

}