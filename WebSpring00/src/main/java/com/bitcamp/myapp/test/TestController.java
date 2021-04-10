package com.bitcamp.myapp.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	//1. request 객체 이용
	@RequestMapping(value="/aLink",method=RequestMethod.GET)
	public String test(HttpServletRequest req, Model model) {
		//클라이언트에서 서버로 데이터 가져오기
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		//서버에 출력
		System.out.println(name+", "+age);
		
		//model 객체에 req한 데이터를 심으면 뷰에서 사용할 수 있다
		model.addAttribute("username", name);
		model.addAttribute("age", age);
		model.addAttribute("msg", "서버에 클라이언트에게 데이터 보내기");
		
		return "mappingTest/aLinkView";
	}
	
	//2. @이용
	//@RequestParam : 클라이언트 측 데이터를 서버로 request한다
	
	//mapping
	@RequestMapping("/aLink2") //get방식은 생략 가능
	
	//req해서 오른쪽 변수에 담는다
	public String test2(@RequestParam("name") String username, @RequestParam("age") int age, Model model ){
		System.out.println("aLink2->"+username+":"+age);
		
		model.addAttribute("username", username); //req한 username
		model.addAttribute("age", age);
		model.addAttribute("msg", "@RequestParam을 이용한 데이터 처리");
		
		return "mappingTest/aLinkView";
	}
	
	
	//3 VO 이용
	@RequestMapping("/aLink3") //vo에 request하여 변수명이 같은 곳으로 값을 심는다  
	public String test3(TestVO vo, Model model) {
		System.out.println("TestVO->"+vo.getUsername()+", "+vo.getAge());
		
		vo.setMsg("vo를 이용한 request 테스트 중");
		
		//클라이언트에게 데이터 보내기
		model.addAttribute("vo", vo);
		
		return "mappingTest/aLinkView2";
	}
	
	@RequestMapping("/aLink4")
	public ModelAndView test4(TestVO vo) {
		System.out.println("TestVO4->"+vo.getUsername()+", "+vo.getAge());
		
		vo.setMsg("ModelAndView테스트 중");
		
		//데이터와 뷰 파일명을 한번에 가지는 클래스
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo); //변수, 데이터
		mav.setViewName("mappingTest/aLinkView2"); 
		
		return mav;
	}
	
	//폼으로 이동하기
	@RequestMapping("/formData")
	public String formTest() {
		
		return "mappingTest/form";
	}
	
	@RequestMapping(value="/formDataOk", method=RequestMethod.POST)
	public ModelAndView formTestOk(TestVO vo) {
		System.out.println("formData->"+vo.getUsername()+", "+vo.getAge());
		
		vo.setMsg("폼데이터 전송 확인");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("mappingTest/aLinkView2");
		

		return mav;
	}
	
}
