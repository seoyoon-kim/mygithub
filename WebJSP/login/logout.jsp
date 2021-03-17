<!-- 3/17 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃=sesison 지우기
	session.invalidate();
	response.sendRedirect("/WebJSP");  
%> 