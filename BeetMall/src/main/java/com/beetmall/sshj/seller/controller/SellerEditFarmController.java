package com.beetmall.sshj.seller.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerEditFarmService;
import com.beetmall.sshj.seller.service.ProductService;
import com.beetmall.sshj.seller.vo.ProductVO;
import com.beetmall.sshj.seller.vo.SearchAndPageVO;
import com.beetmall.sshj.seller.vo.SellerEditFarmVO;

@Controller
public class SellerEditFarmController {
	
	@Autowired
	SellerEditFarmService service;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/sellerEditFarm")
	public ModelAndView edit_farm(HttpSession session, ProductVO vo, SearchAndPageVO spvo) {
		ModelAndView mav = new ModelAndView();
	
		if(session.getAttribute("logId")!=null) {
			String userid = (String)session.getAttribute("logId");

			if((int)session.getAttribute("logType") == 2 ) {
				mav.addObject("result", service.selectInfo(userid)); // 전체 데이터 불러오기
				mav.addObject("result1",service.discountSelect(userid)); // 디스카운트 확인
				mav.addObject("favorite", service.selectFavorite(userid)); // 즐겨찾기 수 불러오기
				mav.setViewName("seller/sellerEditFarm");
			}	else {
				mav.setViewName("redirect:/");
				
			}
			
		} else {
			mav.setViewName("redirect:/");
			
		}
		
		
		return mav;
	}
	
	@RequestMapping("/sellerEditFarmListView")
	public ModelAndView editWindowOpen(ProductVO vo, SearchAndPageVO sapvo, HttpSession session, HttpServletRequest req) {
		
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
			
		mav.setViewName("seller/sellerEditFarmListView"); 
		  
		
		return mav;
	}
	
	@RequestMapping(value="/sellerEditFarmUpdate",method= RequestMethod.POST)
	public ModelAndView farmEditUpdate(HttpSession session, HttpServletRequest req, SellerEditFarmVO vo) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		
		// 저장위치를 구한다
		String path = session.getServletContext().getRealPath("/upload");
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		
		MultipartFile mf = mr.getFile("filename");
		
		String orgName = mf.getOriginalFilename(); // 원래 파일명
		if(mf.getSize() != 0 ) {
			// farmprofile 새로운 이미지를 등록한다
			
			// db에 등록되어 있는 파일명을 가져온다
			String checkImg = service.getImgName(vo.getStorenum());
			
			
			if(orgName != null && !orgName.equals("")) {
				
				File ff = new File(path,orgName);
				int i = 0;
				while(ff.exists()) {
					int pnt = orgName.lastIndexOf(".");
					System.out.println(orgName);
					
					String firstName = orgName.substring(0,pnt);
					String extName = orgName.substring(pnt+1);
					
					ff = new File(path, firstName + "("+ ++i + ")." + extName);
							
				}
				
				try {
					mf.transferTo(ff);
					
				}catch(Exception e) {
					System.out.println("업로드 에러....");
					e.printStackTrace();
				}
				
				vo.setFarmprofile(ff.getName());
			}
			
			// 업데이트문
			int result1 = service.farmUpdate(vo);
			int result2 = service.sellerUpdate(vo);
			
			if( result1>0 && result2>0) {
				//수정 성공
				
				//기존에 있던 파일은 삭제한다.
				try {
					File delFile = new File(path,checkImg);
					delFile.delete();
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				mav.setViewName("redirect:sellerIntroFarm");
			} else {
				// 수정 실패
				
				try {
					File delFile = new File(path,vo.getFarmprofile());
					delFile.delete();
				}catch(Exception e) {
					e.printStackTrace();
				}
				mav.setViewName("redirect:sellerEditFarm");
			}
			
			System.out.println("1번");
		} else {
			// 새로운 이미지를 등록하지 않는다
			// 업데이트문
			int result1 = service.farmUpdate(vo);
			int result2 = service.sellerUpdate(vo);
			
			if( result1>0 && result2>0) {
				//수정 성공
				
				mav.setViewName("redirect:sellerIntroFarm");
			} else {
				// 수정 실패
				
				mav.setViewName("redirect:sellerEditFarm");
			}
			System.out.println("2번");			
		}
		
		
//		System.out.println("test= "+req.getParameter("filename"));
//		System.out.println("test= "+vo.getFarmprofile());
//		System.out.println("test= "+vo.getFarmname());
//		System.out.println("test= "+vo.getFarmintro());
//		
//		System.out.println("test= "+vo.getUserid()); 
//		System.out.println("test= "+vo.getStorename());
//		System.out.println("test= "+vo.getSellername());
//
//		System.out.println("test= "+vo.getBank());
//		System.out.println("test= "+vo.getBankaccount());
//		System.out.println("test= "+vo.getBankname());
//		
//		System.out.println("test= "+vo.getStoreemail());
//		
//		System.out.println("test= "+vo.getProductnum());
		
		
		
		
		return mav;
	}
}
