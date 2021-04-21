package com.bitcamp.home.board;

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
public class TransactionTestController {
	@Autowired
	SqlSession sqlSession;
	
	//=========transaction================
	//servlet-context.xml의 트랜잭션 객체를 di(의존주입)한다
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/transactionForm")
	public String Frm() { 
		return "board/transactionForm";
	}
	
	//transcation 처리할 컨트롤러에 @Transactional 표시
	@RequestMapping(value="/tansactionInsert", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView tansactionTest(BoardVO vo, HttpSession session, HttpServletRequest req) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String)session.getAttribute("logId"));
		
		BoardVO vo2 = new BoardVO();
		vo2.setSubject(vo.getSubject());
		vo2.setContent(vo.getContent());
		vo2.setIp(vo.getIp());
		vo2.setUserid(vo.getUserid()+"111111111111111111111111111111111111111111111111111111");
		
		//===================트랜잭션 구현위한 객체생성===============
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		//PROPAGATION_REQUIRED : 트랜잭션이 있으면 그 상황에서 실행, 없으면 새로운 트랜잭션을 생성해서 실행
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜잭션호출
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			BoardDAOImpl dao = sqlSession.getMapper(BoardDAOImpl.class);
			int result1 = dao.boardInsert(vo);
			int result2 = dao.boardInsert(vo2);//내용은 같고 시퀀스가 다르다
			
			//정상구현되면 commit 실행
			transactionManager.commit(status);
		}catch(Exception e) {
			//exception 발생시 자동 롤백(34 line) 
		}
		 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:boardList");
		return mav;
	}
}
