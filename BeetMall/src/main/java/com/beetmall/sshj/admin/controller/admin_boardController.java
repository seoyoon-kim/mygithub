package com.beetmall.sshj.admin.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.beetmall.sshj.admin.dao.AdminBoardDAO;
import com.beetmall.sshj.admin.dao.admin_DataDAO;
import com.beetmall.sshj.admin.service.Admin_BoardService;
import com.beetmall.sshj.admin.vo.AdminBoardVO;
import com.beetmall.sshj.admin.vo.Admin_Board_PageVO;
import com.beetmall.sshj.admin.vo.admin_DataVO; 
 

@Controller
public class admin_boardController { 
	@Inject
	Admin_BoardService boardService;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	//jdbc template 담을 변수
		public JdbcTemplate jdbcTemplate; 
		public JdbcTemplate getJdbcTemplate() {
			return jdbcTemplate;
		}
		@Autowired
		public void setJdbcTemplate(JdbcTemplate template) { //외부에서 데이터 받아서 jdbctemp 변수에 보내서 저장
			this.jdbcTemplate = template;
			Constants.jdbcTemplate = template;//constants.java 파일로 보낸다
		}

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
		public String noticeBoardWrite() {  	
	   		return "/admin/noticeBoardWrite";		 
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
		 
		//이미지 파일 변수 및 저장 위치
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
		//추가하지 않으면 값을 지정해서 넣어준다. 
		vo.setInfoattach(orgName);
		System.out.println("vo에 set해주는 이미지 이름 orgName -> "+orgName);
		

		//공지등록 
		int result = boardService.noticeWriteOk(vo);
		System.out.println("공지 insert -> "+ result);
		
		if(result>0) { //글 등록 성공
			System.out.println("[공지 등록 완료]");
			transactionManager.commit(status); 
			mav.setViewName("/admin/noticeBoardList");
		}else {//글 등록 실패
			System.out.println("[공지 등록 실패]");
			mav.setViewName("/admin/noticeBoardWrite");
		}
		}catch(Exception e){
			System.out.println("<<공지등록 트랜잭션 에러 발생>>");
			e.printStackTrace();
		}
			return mav; 
	}   
	//공지 보기 
 		@RequestMapping("noticeBoardView")
 		public ModelAndView noticeBoardView(int infonum) {
 			ModelAndView mav = new ModelAndView();
 			mav.addObject("vo", boardService.noticeBoardView(infonum)); 
 			mav.setViewName("admin/noticeBoardView");
 			return mav;
 		}
 		//파일 다운로드 
 		@RequestMapping("/filedownload") 
 		public void fileDownload(HttpServletRequest request, HttpServletResponse response) { 
 			String saveDir = request.getSession().getServletContext().getRealPath("/resources/adminimg"); 
 			String fileName = "20190223-223005277_939.jpg"; 
 			File file = new File(saveDir + "/" + fileName); 
 			FileInputStream fis = null; BufferedInputStream bis = null; 
 			ServletOutputStream sos = null; 
 			try { 
 				fis = new FileInputStream(file); 
 				bis = new BufferedInputStream(fis); 
 				sos = response.getOutputStream(); 
 				String reFilename = ""; 
 				boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1; 
 				if(isMSIE) { 
 					reFilename = URLEncoder.encode("이미지 파일.jpg", "utf-8"); 
 					reFilename = reFilename.replaceAll("\\+", "%20"); 
 				}else { 
 					reFilename = new String("이미지 파일.jpg".getBytes("utf-8"), "ISO-8859-1"); 
 				} 
 				response.setContentType("application/octet-stream;charset=utf-8"); 
 				response.addHeader("Content-Disposition", "attachment;filename=\""+reFilename+"\""); 
 				response.setContentLength((int)file.length()); int read = 0; 
 				while((read = bis.read()) != -1) { 
 					sos.write(read); 
 				} 
 				}catch(IOException e) { e.printStackTrace(); 
 				}finally { 
 					try { 
 						sos.close(); 
 						bis.close(); 
 					}catch (IOException e) { 
 						e.printStackTrace(); 
 					} 
 				} 
 			}

  

	//공지 수정하기로 이동
 		@RequestMapping("/noticeBoardEdit")
 		public ModelAndView noticeBoardEdit(int infonum) { 
 			ModelAndView mav = new ModelAndView();
 			mav.addObject("vo", boardService.noticeBoardView(infonum));    
 			mav.setViewName("/admin/noticeBoardEdit");
 			return mav;   
 		}
	
	//공지 수정하기
 	 	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	 	@RequestMapping(value="/noticeBoardEditOk", method=RequestMethod.POST)   
 		public ModelAndView noticeBoardEditOk(AdminBoardVO vo, HttpSession session, HttpServletRequest req) { 
 	 		ModelAndView mav = new ModelAndView();
 	 		admin_DataDAO dao = new admin_DataDAO();
 	 	//데이터베이스의 파일명을 가져온다
 			admin_DataVO fileVO = dao.getSelectFilename(vo.getInfonum());
 			List<String> selFile =  new ArrayList<String>();
 			selFile.add(fileVO.getInfoattach());
 			
 			//삭제한 파일
 			String delFile[] = req.getParameterValues("delFile");
 			
 			//첨부파일 받아오기 
 			MultipartHttpServletRequest multireq = (MultipartHttpServletRequest)req;
 			
 			MultipartFile file = multireq.getFile("file"); 

 	 		System.out.println("multireq ->"+multireq);
 			System.out.println("file -> "+file);
 			 
 			//이미지 파일 변수 및 저장 위치
 			String orgName = file.getOriginalFilename();
 			System.out.println("orgName ->"+ orgName);
 			String path = req.getSession().getServletContext().getRealPath("resources/adminImg");
 			System.out.println("path ->"+ path);
 			
 			//session userid
 			vo.setUserid((String)session.getAttribute("logId"));
 			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
 			def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
 			TransactionStatus status = transactionManager.getTransaction(def); 
 			
 			List<String> newUpload = new ArrayList<String>();
 			if(newUpload!=null && list.size()>0) {//새롭게 업로드 된 파일이 있는 경우
 				
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
	 			//추가하지 않으면 값을 지정해서 넣어준다. 
	 			vo.setInfoattach(orgName);
	 			System.out.println("vo에 set해주는 이미지 이름 orgName -> "+orgName);
	 			 
	 			//공지수정 
	 			int result = boardService.noticeBoardEditOk(vo);
	 			System.out.println("공지 수정 -> "+ result);
	 			
	 			if(result>0) { //글 등록 성공
	 				System.out.println("[공지 수정 완료]");
	 				transactionManager.commit(status); 
	 	 			mav.addObject("vo", boardService.noticeBoardView(vo.getInfonum()));    
	 				mav.setViewName("/admin/noticeBoardView");
	 			}else {//글 등록 실패
	 				System.out.println("[공지 수정 실패]");
	 				mav.setViewName("/admin/noticeBoardEdit");
	 			}
	 			}catch(Exception e){
	 				System.out.println("<<공지수정 트랜잭션 에러 발생>>");
	 				e.printStackTrace();
	 			}
 			}//if
 			//DB선택 파일 목록에서 삭제한 파일 지우기
 			if(delFile!=null) {
 				for(String delName:delFile) {
 				selFile.remove(delName);
 				}
 			}
 			//DB선택파일목록에 새로 업로드 된 파일명 추가
 			for(String newFile:newUpload) {
 				selFile.add(newFile);
 			}
 			vo.setFilename1(selFile.get(0));
 			if(selFile.size()>1) {
 				vo.setFilename2(selFile.get(1));
 			}
 			if(dao.dataUpdate(vo)>0) { //수정
 				if(delFile!=null){//삭제파일 지우기
 					for(String dFile:delFile) {
 						try {
 							File dFileObj = new File(path, dFile);
 							dFileObj.delete();
 							
 						}catch(Exception e) {
 							e.printStackTrace();
 						}
 					}
 				}
 				//글 내용 보기
 				mav.addObject("infonum", vo.getInfonum());
 				mav.setViewName("redirect:dataView");
 			}else {//수정실패
 				//새로 업로드 된파일 지우기
 				if(newUpload.size()>0) {
 					for(String newFile : newUpload) {
 						try {
 							File dFileObj = new File(path, newFile);
 							dFileObj.delete();
 						}catch(Exception e) {
 							e.printStackTrace();
 						} 
 					}
 				}
 				//글 수정 폼으로 돌아가기 
 				mav.setViewName("redirect:dataEdit");
 			} 
 			return mav;
 		}
 		 
	//공지 삭제하기
	 @RequestMapping("/noticeBoardDelete")
	public ModelAndView noticeBoardDelete(int infonum) {  
		 ModelAndView mav = new ModelAndView();
		 
	  	if(boardService.noticeBoardDelete(infonum)>0){//삭제 성공시
			mav.setViewName("redirect:noticeBoardList");
		}else {//삭제 실패
			mav.addObject("infonum", infonum);
			mav.setViewName("redirect:noticeBoardEdit");
		}
		return mav;
	} 
	  
	
}
	
	
	
  
	
	 