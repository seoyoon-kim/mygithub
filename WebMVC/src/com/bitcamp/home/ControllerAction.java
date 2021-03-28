package com.bitcamp.home;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//03.24
 
@WebServlet("/*.do") //사용자가 접속을 하면 모든 접속을 여기로 받는다
public class ControllerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//Mapping 주소와 실행할 Command 객체를 보관할 맵
    HashMap<String, CommandService> map = new HashMap<String, CommandService>();   
    
    public ControllerAction() {
        super(); 
    }
 
	public void init(ServletConfig config) throws ServletException { 
		//properties 파일명을 web.xml에서 가져오기
		String propertiesFilename = config.getInitParameter("proConfig");
		Properties prop = new Properties(); //key, value 모두 String 
		                                     //value인 CommandService를 객체로 만들어 저장해야 한다.
		
		try {
			FileInputStream fis = new FileInputStream(propertiesFilename);
			//urlMapping.properties 파일의 내용을 읽어와 properties 객체로 대입한다.
			prop.load(fis);
			
		}catch(Exception e) {
			System.out.println("프로퍼티 객체 생성 에러->"+e.getMessage());
		}
		//////////////////////////////////////////////////////////
		try {
			//properties의 키 목록 구하기
			Enumeration keyList= prop.propertyNames(); //*.do /index.do 
			while(keyList.hasMoreElements()) {
				//key에 대한 value(Command Class 객체명을 가져온다:String)
				String key = (String)keyList.nextElement();
				String commandName = prop.getProperty(key); ///*.do=>com.bitcamp.home.IndexCommand
				                                             ///index.do=>com.bitcamp.home.IndexCommand
				System.out.println(key+"=>"+commandName);
				
				//문자열을 객체로 생성하여 Map에 추가
				Class classObject = Class.forName(commandName);
				CommandService service = (CommandService)classObject.getDeclaredConstructors()[0].newInstance();
				map.put(key, service);
			}
			
			
		}
		catch(Exception e) {
			System.out.println("프로퍼티의 내용을 Map 객체로 변환 에러->"+e.getMessage());
		}
	}
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//접속자의 url 주소를 알아낸다
		String uri = request.getRequestURI(); //    /webMVC/index.do
		String ctx = request.getContextPath(); //   /webMVC
		System.out.println("uri=>"+uri);
		System.out.println("ctx=>"+ctx);
		                            //시작 값 : "/webMVC"의 길이
		String urlMapping = uri.substring(ctx.length()); // /index.do
				
		CommandService command = map.get(urlMapping);
		
		String viewFilename = command.processStart(request, response);
		
		//viewFile로 이동하기
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewFilename);
		dispatcher.forward(request, response);
	}
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);	//dopost()로 접속해도 doget()으로 보낸다
	}

}
