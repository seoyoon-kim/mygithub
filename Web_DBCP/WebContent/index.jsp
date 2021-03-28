<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>  
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	//1. DB연결-드라이브 로딩 필요 없다. 이미 연결이 된 것.
	//Context 객체
	Context ctx = new InitialContext();
	Context envCtx = (Context)ctx.lookup("java:comp/env");
	//DataSource 객체
	DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
	
	Connection conn = ds.getConnection();
	
	String sql = "select no, subject, userid, hit, writedate from board order by no desc";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="URF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	ul, li{margin:0; padding:0; list-style-type:none;}
	li{float:left; width:40px; line-height:40px; width:10%; }
	li:nth-child(5n+2){width:60%;} 
	.wordCut{white-space:no-wrap; overflow:hidden; text-overflow:ellipsis;}
</style>
</head>
<body>
	<div class="container">
	<h1>게시판 목록</h1>
	<ul>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		<% while(rs.next()){ %>
		<li><%=rs.getInt(1) %></li>
		<li class="wordCut"><%=rs.getString(2) %></li>
		<li><%=rs.getString(3) %></li>
		<li><%=rs.getInt(4) %></li>
		<li class="wordCut"><%=rs.getString(5) %></li>
	<%} 
		try{//db연결 반환
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			
		}
	
	
	%>
	</ul> 
	</div>
</body>
</html>
<!-- 

DBCP(프레임워크)
1. 프레임 워크 준비하기
1)dbcp 
2)collections
3)pool 
다운로드해서 lib에 복사

2. ojdbc 복사

3. 

4. 환경변수에 classpath 설정

5. 톰캣서버의 conf/server.xml의 <globalNamingSources에 아래 코드 추가
 -->
<!--DBCP 
	<Resource 
		name="jdbc/myoracle"
		auth="Container"
		type="javax.sql.DataSource"
		driverClassName="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:xe"
		username="c##scott"
		password="tiger"
		maxActive="20"
		maxIdle="10"
		maxWait="-1"/>

 DBCP-------------------------------------------->

<!-- 

 6. 톰캣 서버의 conf/context.xml 내에 아래 코드 추가
 
<Context reloadable="true">
    <ResourceLink
	global="jdbc/myoracle"
	name="jdbc/myoracle"
	type="javax.sql.OracleDataSource" 
  />

7. 이클립스 WEB-INF/web.xml 파일의 <web-app> 태그에 추가
<resource-ref>
		<description>Oracle Datasource example</description>
		<res-ref-name>jdbc/myoracle</res-ref-name>
		<res-type>javax.sql.DataSource</res-type>
		<res-auth>Container</res-auth>
	</resource-ref> 

8. 톰캣 서버의 conf/context.xml 파일을 복사하여 
   이클립스의 META-INF에 붙여넣기
   conf/server.xml에 입력된 <Resource>를 복사하여 context.xml로 붙여넣는다.
   
    




 -->

