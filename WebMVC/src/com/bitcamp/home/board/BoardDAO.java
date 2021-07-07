package com.bitcamp.home.board;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;
import com.bitcamp.home.member.MemberDAO;
import com.bitcamp.home.member.MemberVO;

//BoardDAOImpl.java 이렇게 명명하는 사람들도 있다
public class BoardDAO extends DBCPConn implements BoardDAOService {
	 
	@Override
	public int oneRecordInsert(BoardVO vo) {
	  int cnt = 0;
	  try {
		  getConn();
		  
		  String sql = "insert into board(no, subject, content, userid, hit, writedate, ip) "
				  		+" values(boardsq.nextval, ?, ?, ?, 0, sysdate, ?)";
		  pstmt = con.prepareStatement(sql);
		  pstmt.setString(1, vo.getSubject());
		  pstmt.setString(2, vo.getContent());
		  pstmt.setString(3, vo.getUserid());
		  pstmt.setString(4, vo.getIp());
		  
		  cnt = pstmt.executeUpdate();
		  
	  }catch(Exception e) {
		System.out.println("게시글 DB 추가 에러 발생->");
		e.printStackTrace();
	  }finally {
		  getClose();
	  }	   
		return cnt;
	}
	 
		 
	@Override
	public void oneRecordSelect(BoardVO vo) {
		 try {
			 getConn();
			 
			 String sql = "select no, subject, content, userid, writedate, hit from board where no=?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,  vo.getNo());
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 vo.setNo(rs.getInt(1));
				 vo.setSubject(rs.getString(2));
				 vo.setContent(rs.getString(3));
				 vo.setUserid(rs.getString(4));
				 vo.setWritedate(rs.getString(5));
				 vo.setHit(rs.getInt(6));
			 }
			 
		 }catch(Exception e) {
			 System.out.println("1개 레코드 선택 에러->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }

	}

	@Override
	public int boardDelete(int no, String userid) {
		 int result = 0;
		 try {
			 getConn();
			 
			 String sql = "delete from board where no=? and userid=?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,  no);
			 pstmt.setString(2, userid);
			 
			 result = pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("글 삭제 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
		return result;
	}

	@Override
	public void hitCount(int no) {
		 try {
			 getConn();
			 
			 String sql = "update board set hit=hit+1 where no=?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,  no);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("조회수 증가 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		int totalRecord = 0;
		try {
			getConn();
			
			sql = "select count(no) from board";
			if(vo.getSearchWord() !=null && !vo.getSearchWord().equals("")) {
				sql += " where " + vo.getSearchKey() + " like ?";
			}
			pstmt = con.prepareStatement(sql);
			if(vo.getSearchWord() !=null && !vo.getSearchWord().equals("")) {
				 pstmt.setString(1,  "%"+vo.getSearchWord()+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("총 레코드 선택 에러->");
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return totalRecord;
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		 int result = 0;
		 try {
			 getConn();
			 
			 sql = "update board set subject=?, content=? where no=? and userid=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, vo.getSubject());
			 pstmt.setString(2,  vo.getContent());
			 pstmt.setInt(3, vo.getNo());
			 pstmt.setString(4,  vo.getUserid());
			 
			 result = pstmt.executeUpdate(); //result = 0 or 1
			 
		 }catch(Exception e) {
			 System.out.println("게시판 글 수정 에러 발생->");
			 e.printStackTrace();
		 }finally{
			 getClose();
		 }
		return result;
	
	}

	@Override
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo) {
		 List<BoardVO> list = new ArrayList<BoardVO>();
		 try {
			 getConn();
			 
			 sql = "select * from "
					 + "( select * from "
					 + " ( select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from board ";
			 //검색어가 있을때
			 if(vo.getSearchWord() !=null && !vo.getSearchWord().equals("")) {
				 sql += " where " + vo.getSearchKey() + " like ?";
			 }
			 	 sql += " order by no desc)"
			 	 		+ " where rowNum<=? order by no )"
			 			+ " where rowNum<=? order by no desc"; 
			 	 
			 	 pstmt = con.prepareStatement(sql);
			 	 
			 	 if(vo.getSearchWord()==null) { //검색어가 없을 때
			 		 pstmt.setInt(1, vo.getPageNum()*vo.getOnePageRecord());
			 		 if(vo.getPageNum()==vo.getTotalPage()) { //마지막 페이지가 총 페이지 수와 같으면
			 			 pstmt.setInt(2, vo.getLastPageRecord());
			 			 
			 		 }else {
			 			 pstmt.setInt(2, vo.getOnePageRecord());
			 		 }
			 	 }else { //검색어가 있을 때
			 		 pstmt.setString(1,"%"+vo.getSearchWord()+"%");
			 		 pstmt.setInt(2,vo.getPageNum()*vo.getOnePageRecord());
			 		 if(vo.getPageNum()==vo.getTotalPage()) {
			 			 pstmt.setInt(3,  vo.getLastPageRecord());
			 		 }else {
			 			 pstmt.setInt(3,  vo.getOnePageRecord());
			 		 }
			 	 }
			 
			 	 rs = pstmt.executeQuery();
			 	 
			 	 while(rs.next()) {
			 		 list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getInt(4)));
			 	 }
		 
		 }catch(Exception e) {
			 System.out.println("레코드 1페이지 선택 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
		return list;
	}


	@Override
	public String getUserid(int no) {
		String userid="";
		try {
			getConn();
			
			sql = "select userid from board where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userid = rs.getString(1);
			}
			
		}catch(Exception e) {
			System.out.println("글쓴이 아이디 선택 에러 발생->");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return userid;
	}

}
