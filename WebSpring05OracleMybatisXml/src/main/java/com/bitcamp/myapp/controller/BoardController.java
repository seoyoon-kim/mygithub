package com.bitcamp.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession; 
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
import com.bitcamp.myapp.vo.BoardVO;
import com.bitcamp.myapp.vo.MemberVO; 
import com.bitcamp.myapp.service.BoardService;

@Controller
public class BoardController {
	@Inject
	BoardService boardService;
	
	@RequestMapping("/boardList")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", boardService.boardAllRecord());
		mav.setViewName("/board/boardList");
		return mav;
	}
	
	
	@RequestMapping("/boardWrite")
	public String boardWrite() { 
		 return "/board/boardWrite"; 
	}
	
	@RequestMapping(value="/boardWriteOk", method=RequestMethod.POST)
	public ModelAndView boardWriteOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
		vo.setIp(req.getRemoteAddr());
			
		vo.setUserid(((MemberVO)session.getAttribute("logVo")).getUserid()); 
		//또는 MemberVO vo2 = (MemberVO)session.getAttribute("logVo");//id, 이름이 vo2에 저장
		//vo.setUserid(vo2.getUserid());	
		
		ModelAndView mav = new ModelAndView();
		if(boardService.boardInsert(vo)>0) { //글 등록 성공
			mav.setViewName("redirect:boardList");
		}else {//글 등록 실패
			mav.setViewName("redirect:boardWrite");
		}
			return mav;
	}
	
	//글 보기
	@RequestMapping("/boardView")
	public ModelAndView boardView(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", boardService.boardSelect(no));
		mav.setViewName("board/boardView");
		return mav;
	}
	
	//글 수정
	@RequestMapping("/boardEdit")
	public String boardEdit(int no, Model model) {
		model.addAttribute("vo", boardService.boardSelect(no));
		return "board/boardEdit"; 
	}
	
	@RequestMapping(value="/board/boardEditOk", method=RequestMethod.POST)
	public ModelAndView boardEditOk(BoardVO vo, HttpSession session) {
		vo.setUserid(((MemberVO)session.getAttribute("logVo")).getUserid()); 
		ModelAndView mav = new ModelAndView();
		
		if(boardService.boardUpdate(vo)>0) { //글 수정 성공
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:/boardView");
		}else {
			mav.setViewName("redirect:boardEdit");
		} 
		return mav;
	}

	@RequestMapping("/boardDelete")
	public ModelAndView boardDelete(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("logVo");
		if(boardService.boardDelete(no, vo.getUserid())>0) {//삭제 성공
			mav.setViewName("redirect:boardList");
		}else {
			mav.addObject("no",no);
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}
}