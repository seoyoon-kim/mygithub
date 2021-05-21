package com.beetmall.sshj.admin.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.beetmall.sshj.admin.service.Admin_BoardService;
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO; 
 

@Controller
public class admin_boardController { 
	@Inject
	Admin_BoardService boardService;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//////////////////////공지 관리///////////////////////////////////// 
	//공지 목록 보기
	@RequestMapping("/noticeBoardList")
	public ModelAndView noticeBoardList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Admin_Board_PageVO pageVO = new Admin_Board_PageVO();
		
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) { 
			pageVO.setPageNum(Integer.parseInt(pageNumStr));
		}
		 
		pageVO.setSearchKey(req.getParameter("searchKey"));
		pageVO.setSearchWord(req.getParameter("searchWord"));
	//	pageVO.setTotalRecord(boardService.noticeAllRecord(pageVO));
		
		mav.addObject("list", boardService.noticeBoardList(pageVO));
		mav.addObject("pageVO",pageVO);
		
		mav.setViewName("/admin/noticeBoardList");
		
		return mav;
	}
	//공지 작성하기
	   	@RequestMapping("/noticeBoardWrite")
		public ModelAndView noticeBoardWrite(AdminBoardVO vo) { 
	 		ModelAndView mav = new ModelAndView();			
			mav.setViewName("/admin/noticeBoardWrite");		
			return mav; 
		}  
	
	 	@RequestMapping(value = "noticeWriteOk")
	    public String requestupload1(MultipartHttpServletRequest mtfRequest) {
	        String src = mtfRequest.getParameter("src");
	        System.out.println("src value : " + src);
	        MultipartFile mf = mtfRequest.getFile("file");

	        String path = mtfRequest.getSession().getServletContext().getRealPath("resources/adminImg");

	        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	        long fileSize = mf.getSize(); // 파일 사이즈

	        System.out.println("originFileName : " + originFileName);
	        System.out.println("fileSize : " + fileSize);

	        String safeFile = path + System.currentTimeMillis() + originFileName;

	        try {
	            mf.transferTo(new File(safeFile));
	        } catch (Exception e) { 
	            e.printStackTrace();
	        }  

	        return "/admin/noticeBoardList";
	    }
 	 
	 	
	
	//공지 작성하기
 	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	@RequestMapping(value="/noticeWriteOk", method=RequestMethod.POST)
	public ModelAndView noticeBoardWriteOk(AdminBoardVO vo, HttpSession session, HttpServletRequest req) { 
 		ModelAndView mav = new ModelAndView();
 		//첨부파일 받아오기 
		MultipartHttpServletRequest multireq = (MultipartHttpServletRequest)req;
		
		MultipartFile file = multireq.getFile("file"); 

 
		System.out.println("multireq ->"+multireq);
		System.out.println("file -> "+file);
		 
		//이미지 파일 변수
		String orgName = file.getOriginalFilename();
		System.out.println("orgName ->"+ orgName);
		String path = req.getSession().getServletContext().getRealPath("resources/adminImg");
		System.out.println("path ->"+ path);
		
		//session userid
		vo.setUserid((String)session.getAttribute("logId"));
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def); 
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
				try {
					file.transferTo(new File(path,orgName));
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(boardService.boardUpdate(vo)>0) { //글 등록 성공
			transactionManager.commit(status); 
			mav.setViewName("/admin/noticeBoardList");
		}else {//글 등록 실패
			mav.setViewName("/admin/noticeBoardWrite");
		}
		}catch(Exception e){
			System.out.println("<<상품등록 트랜잭션 에러 발생>>");
			e.printStackTrace();
		}
			return mav; 
	}  

 	
 	 
	 
	//공지 수정하기
	@RequestMapping("/noticeBoardEdit")
	public String noticeBoardEdit(int no, Model model) { 
		//model.addAttribute("vo", boardService.boardUpdate(vo));
		return "/admin/noticeBoardEdit"; 
	}
	
	//공지 수정하기
	/*	@RequestMapping(value="/board/boardEditOk", method=RequestMethod.POST)
	public ModelAndView boardEditOk(AdminBoardVO vo, HttpSession session) {
		vo.setUserid(((MemberVO)session.getAttribute("logVo")).getUserid()); 
		ModelAndView mav = new ModelAndView();
		
		if(boardService.boardUpdate(vo)>0) { //글 수정 성공
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:/boardView");
		}else {
			mav.setViewName("redirect:boardEdit");
		} 
		return mav;
	}*/
	
	//공지 삭제하기
	 @RequestMapping("/noticeBoardDelA")
	public ModelAndView noticeBoardDel(int infonum) {  
		 ModelAndView mav = new ModelAndView();
		 
	  	if(boardService.boardDelA(infonum)>0){//삭제 성공시
			mav.setViewName("redirect:noticeBoardList");
		}else {//삭제 실패
			mav.addObject("infonum", infonum);
			mav.setViewName("redirect:noticeBoardEdit");
		}
		return mav;
	} 
	  
	
}
	
	
	
  
	
	 