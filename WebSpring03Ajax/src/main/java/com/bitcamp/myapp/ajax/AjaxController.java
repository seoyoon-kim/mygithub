package com.bitcamp.myapp.ajax;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	@RequestMapping("/ajaxView")
	public String ajaxView() {
		return "ajax/ajaxView";
	}
	
	//한글이 리턴되는 경우 get 방식이어도 value, method, 반환 속성 작성
	@RequestMapping(value="/ajaxString", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody//뷰페이지로 이동하는 것이 아닌 결과물만 출력하라
	public String ajaxString(String num, String name, String id) {
		
		return num+", "+name+", "+id;
	}
/*	public String ajaxString(HttpServletRequest req) {
		String num = req.getParameter("num");
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		
		String msg = "num="+num+", name="+name+", id="+id;
		System.out.println(msg);
		return "서버에서 받은 데이터->"+msg;
	}
	*/
	@RequestMapping("/ajaxObject")
	@ResponseBody//뷰페이지로 이동하는 것이 아닌 결과물만 출력하라
	public TestVO ajaxObject(TestVO vo) {
		vo.setTel("010-1234-5678");
		vo.setAddr("서울시 마포구 백범로");
		return vo;
	}
	
	@RequestMapping("/ajaxList")
	@ResponseBody 
	public List<TestVO> ajaxList(TestVO vo) {
		List<TestVO> list = new ArrayList<TestVO>();
		list.add(new TestVO("1","홍길동","hong","010-5555-5555", "서울시 마포구"));
		list.add(new TestVO("2","김길동","kim","010-4444-4444", "서울시 용산구"));
		list.add(new TestVO("3","박길동","park","010-3333-3333", "서울시 성동구"));
		list.add(new TestVO("4","최길동","choi","010-2222-2222", "서울시 종로구"));
		list.add(new TestVO("5","이길동","lee","010-1111-1111", "서울시 서대문구"));
		return list;
	}
	
	@RequestMapping("/ajaxMap")
	@ResponseBody 
	public HashMap<String, TestVO> ajaxMap(TestVO vo) {
		 	HashMap<String, TestVO> map= new HashMap<String, TestVO>();
		
		map.put("p1", new TestVO("1","이순신","lee","010-4422-4554", "서울시 용산구"));
		map.put("p2", new TestVO("2","최순신","choi","010-6954-4499", "서울시 용산구"));
		map.put("p3", new TestVO("3","김순신","kim","010-4135-7694", "서울시 용산구"));
	
		return map;
	}
	
	@RequestMapping(value="/ajaxJson", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody 
	public String ajaxJson() {
		int no = 1234;
		String name = "홍길동";
		String tel = "010-1234-5678";
		String addr = "서울시 마포구 백범로";
		String email = "abcd@nate.com";
		
		String jsonStr = "{\"no\":\""+no+"\",\"name\":\""+name+"\",\"tel\":\""+tel+"\",\"addr\":\""+addr+"\",\"email\":\""+email+"\"}";
		System.out.println(jsonStr);
		return jsonStr;

	/*	json 출력은 다음과 같다:
	 *  {"no":"1234","name":"홍길동", "tel":"010-1234-5678", "addr":"서울시 마포구 백범로"}
	  * */
	}
}