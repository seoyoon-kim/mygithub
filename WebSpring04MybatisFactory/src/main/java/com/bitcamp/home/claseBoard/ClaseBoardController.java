package com.bitcamp.home.claseBoard;

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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClaseBoardController {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//글목록
	@RequestMapping("/claseList")
	public ModelAndView claseList() {
		ModelAndView mav = new ModelAndView();
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		
		mav.addObject("totalRecord", dao.getTotalRecord());//총 레코드 수
		
		mav.addObject("list", dao.claseAllRecord());
		
		mav.setViewName("claseBoard/claseList");
		return mav;
	}
	
	//글쓰기 폼
	@RequestMapping("/claseWrite")
	public String claseWrite() {
		return "claseBoard/claseWrite";
	}
	
	//글쓰기 : DB에
	@RequestMapping(value="/claseWriteOk", method=RequestMethod.POST)
	public ModelAndView claseWriteOk(ClaseBoardDTO vo, HttpServletRequest req) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String)req.getSession().getAttribute("logId"));
	 
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		 
		int cnt = dao.claseInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {
			mav.setViewName("redirect:claseList");
		}else {
			mav.setViewName("redirect:claseWrite");
		}
		return mav;		
		}
	
	@RequestMapping("/claseView")
	public ModelAndView claseView(int no) {
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		
		ModelAndView mav = new ModelAndView();
		dao.hitCount(no);//조회수 증가
		mav.addObject("dto",dao.claseSelect(no));
		mav.setViewName("claseBoard/claseView");
		
		//이전글 다음글
		PrevNextVO vo = dao.lagLeadSelect(no);
		mav.addObject("vo",vo);
		return mav;
	}
	
	//답글 쓰기 폼으로 이동
	@RequestMapping("/claseWriteForm")
	public ModelAndView claseWriteForm(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		mav.setViewName("claseBoard/claseWriteForm");
		return mav;
	}
	
	//답글쓰기
	@RequestMapping(value="/claseWriteFormOk", method=RequestMethod.POST)
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public ModelAndView claseWriteFormOk(ClaseBoardDTO dto, HttpSession session, HttpServletRequest req) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		dto.setIp(req.getRemoteAddr());
		dto.setUserid((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		try {
			//1.원글의 ref, step, lvl을 선택한다
			ClaseBoardDTO orgDto = dao.oriInfor(dto.getNo());
			//2.lvl 증가 : 원글번호가 같고 lvl이 원글번호의 lvl보다 크면 1증가
			int lvlCnt = dao.lvlCount(orgDto);
			System.out.println("lvlCnt="+lvlCnt);
			//3. 답글추가
			dto.setRef(orgDto.getRef());
			dto.setStep(orgDto.getStep()+1);
			dto.setLvl(orgDto.getLvl()+1);
			
			int cnt = dao.claseDataInsert(dto);
			if(cnt>0) {
				//원글보기로 가기
				mav.addObject("no",dto.getNo());
				mav.setViewName("redirect:claseView");
				transactionManager.commit(status);
			}else {
				mav.setViewName("redirect:claseWriteForm");
				transactionManager.rollback(status);
			}
		}catch(Exception e) {
			mav.addObject("no", dto.getNo());
			mav.setViewName("redirect:claseWriteForm");
			e.printStackTrace();
		}
		return mav; 
	}
	
	//수정폼으로 이동
	@RequestMapping("/claseEdit")
	public ModelAndView claseEdit(int no) {
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.claseSelect(no));
		mav.setViewName("claseBoard/claseEdit");
		return mav;
	}
	
	//글 수정
	@RequestMapping(value="/claseEditOk", method=RequestMethod.POST)
	public ModelAndView claseEditOk(ClaseBoardDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		int result = dao.claseUpdate(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("no",dto.getNo());
		if(result>0) { //수정완료시-글내용 보기로 보낸다
			mav.setViewName("redirect:claseView");
		}else {//수정실패시-수정페이지로 보낸다
			mav.setViewName("redirect:claseEdit");
		}
		return mav;
	}
	
	//글삭제
	@RequestMapping("/claseDel")
	public ModelAndView claseDel(int no, HttpSession session) {
		ClaseBoardDAOImp dao = sqlSession.getMapper(ClaseBoardDAOImp.class);
		String userid = (String)session.getAttribute("logId");
		//원글 삭제는 답글이 있는 경우 답글까지 삭제
		//답글 삭제는 제목과 글 내용을 "삭제된 글입니다"로 변환
		
		//원글인지 확인->step이 0이면 원글이다
		ClaseBoardDTO orgData = dao.getStep(no); //step,userid 정보가 있다
		
		int result = 0;
		if(orgData.getStep()==0 && orgData.getUserid().equals(userid)) { //원글&작성자 본인일 경우
			result = dao.claseDelete(no);
		}else if(orgData.getStep()>0 && orgData.getUserid().equals(userid)){//답글&작성자 본인일 경우
			result = dao.claseDeleteUpdate(no, userid);
		}
		
		ModelAndView mav = new ModelAndView();
		/*if(result>0) { //삭제성공   -> 주석 살리고, delCheck.jsp 파일 삭제, 아래 mav. 세 줄 삭제해도 제대로 작동한다
			mav.setViewName("redirect:claseList");
		}else {//삭제실패
			mav.addObject("no", no);
			mav.setViewName("redirect:claseView");
		}*/
		mav.addObject("no",no);
		mav.addObject("result", result);
		mav.setViewName("claseBoard/delCheck");
		return mav;
	}
	
	@RequestMapping("/clasePView")
	public String preNext(HttpServletRequest req) {
		int no = Integer.parseInt(req.getParameter("no"));
		req.setAttribute("no", no-1);
		
		return "claseView";
	}

	
	 
}


		
	 
