package com.bitcamp.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConnection {
	protected Connection conn= null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = "";
 
	
	//db연결
	public void getConn() {
		try {
			Context ctx = new InitialContext();
			Context evnCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)evnCtx.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			System.out.println("DB 연결 실패->");
			e.printStackTrace();
		}
		
	}
	//db닫기
	public void getClose() {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			sql="";
		}catch(Exception e) {
			System.out.println("DB 닫기 에러->");
			e.printStackTrace();
		}
	}
}
