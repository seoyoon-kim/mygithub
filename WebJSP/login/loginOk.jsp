<!-- 3/17 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%!
	public Connection getConnection(){
		Connection con = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, "c##scott","tiger");
		}catch(Exception e){
			System.out.println("데이터베이스 로딩, 연결 에러->"+e.getMessage());//e.printStackTrace();
		} 
		return con;
	}
%>
<%
	//mode1으로 로그인하기
	//1. 사용자 화면에서 입력된 아이디, 비밀번호를 가져온다.
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");

	// ojdbc8.jar 연결한다.
	// Build Path -> configure Build Path -> add external jars -> ojdbc8.jar 연결 
	   

	//DB에서 조회한다. : select문 이용
	
	//2. 드라이브 로딩
	//3. DB 연결
	Connection conn = getConnection();
	ResultSet rs;
	
	 //4. PreparedStatement
	   String sql = "select username, userid from register where userid=? and userpwd=?";
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   
	   pstmt.setString(1, userid);
	   pstmt.setString(2, userpwd);
	   
	   rs = pstmt.executeQuery();

	/*
	
	 if(rs.next()){//로그인
      //필요한 정보를 세션영역에 저장한다
      // 왜냐? 지속적인 로그인 유지를 위해
            //세션 : 현재 사이트의 모든 영역에서 접근할 수 있는 데이터
            //         세션변수   세션값
      session.setAttribute("logId", rs.getString(2));
      session.setAttribute("logName",rs.getString(1));
      session.setAttribute("logStatus", "y");

      response.sendRedirect(request.getContextPath()); //  /WebJSP

	}else{ //로그인 실패시
		response.sendRedirect(request.getContextPath()+"/login/logIn_form.html");
	//전에 입력했던 아이디가 삭제되고 없다.
	}
	
	*/
	
	if(rs.next()){ //로그인 성공
		session.setAttribute("logId", rs.getString(2));
		session.setAttribute("logName", rs.getString(1));
		session.setAttribute("logStatus", "Y");		
		%>
		<script>
			alert("로그인 성공하였습니다. 홈페이지로 이동합니다.");
			location.href = "<%=request.getContextPath()%>"; //location.href = "/WebJSP";
			//document.write("<%=request.getContextPath()%>");
			</script>
		<%
	}else{ //로그인 실패
		%>
		<script>
			alert("로그인 실패하였습니다.");
			history.go(-1); //history.back();, 전에 입력했던 아이디가 남아있다.
		</script>
		<%
		
	}
%>