//3.24
package com.bitcamp.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	protected Connection con=null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = null;
	//DB 연결
		public void getConn() {
			try {
				Context ctx = new InitialContext();
				Context envCtx = (Context)ctx.lookup("java:comp/env");
				
				DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
				con = ds.getConnection();
			}catch(Exception e) {
				System.out.println("DBCP 연결 에러->"+e.getMessage());
			}
		}
	//DBClose
	public void getClose() {
		try {
			sql = null;
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(Exception e) {
			
		}
	}
	
}
