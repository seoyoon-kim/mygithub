package com.bitcamp.home.data;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class DataDAO extends DBCPConn implements DataDAOImpl {

	@Override
	public int dataInsert(DataVO vo) {
		 int cnt = 0;
		 try {
			 getConn();
			 
			 sql = "insert into data(no, title, content, userid, filename1, filename2, ip) "
					 +" values(boardsq.nextval, ?,?,?,?,?,?)";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, vo.getTitle());
			 pstmt.setString(2, vo.getContent());
			 pstmt.setString(3, vo.getUserid());
			 pstmt.setString(4, vo.getFilename1());
			 pstmt.setString(5, vo.getFilename2());
			 pstmt.setString(6, vo.getIp());
			 
			 cnt = pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("자료실 글 등록 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
		return cnt;
	}

	@Override
	public void dataSelect(DataVO vo) {
		 try {
			 getConn();
			 
			 sql = "select no, title, content, userid, hit, downcount, to_char(writedate, 'MM-DD HH:MI') writedate, filename1, filename2"
					 +" from data where no=?";
			 pstmt = con.prepareStatement(sql);
			 
			 	pstmt.setInt(1, vo.getNo());
				
			 	rs = pstmt.executeQuery();
				
			 	if(rs.next()) {
			 		vo.setNo(rs.getInt(1));
			 		vo.setTitle(rs.getString(2));
			 		vo.setContent(rs.getString(3));
			 		vo.setUserid(rs.getString(4));
			 		vo.setHit(rs.getInt(5));
			 		vo.setDownCount(rs.getInt(6));
			 		vo.setWritedate(rs.getString(7));
			 		vo.getFilename()[0] = (rs.getString(8));
			 		vo.getFilename()[1] = (rs.getString(9));
			 	}
		 }catch(Exception e) {
			 System.out.println("자료실 글 1개 선택 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
	}

	@Override
	public int dataUpdate(DataVO vo, List<String> newFile) {
		int result = 0;
		try {
			getConn();
			
			sql = "update data set title=?, content=?, filename1=?, filename2=? "
					+ " where no=? and userid=?";
			pstmt = con.prepareStatement(sql);
			 
		 	pstmt.setString(1, vo.getTitle());
		 	pstmt.setString(2, vo.getContent());
		 	pstmt.setString(3, newFile.get(0));
		 	if(newFile.size()==2) {
		 		pstmt.setString(4, newFile.get(1));	
		 	}else {
		 		pstmt.setString(4, null);
		 	}
		 	pstmt.setInt(5, vo.getNo());
		 	pstmt.setString(6, vo.getUserid());
		 	
		 	result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("자료실 글 수정 에러 발생->");
			e.printStackTrace();
		}finally {
			getClose();
		} 
		return result;
	}

	@Override
	public int dataDelect(DataVO vo) {
		 int cnt = 0;
		 try {
			 getConn();
			 sql = "delete from data where no=? and userid=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, vo.getNo());
			 pstmt.setString(2,  vo.getUserid());
			 cnt = pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("자료실 레코드 삭제 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }
		return cnt;
	}

	@Override
	public List<DataVO> dataSelectAll() {
		List<DataVO> lst = new ArrayList<DataVO>();
		try {
			getConn();
			sql = "select no, title, userid, filename1, filename2, hit, downCount, to_char(writedate, 'MM-DD HH:MI') writedate "
					+" from data order by no desc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DataVO vo = new DataVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setUserid(rs.getString(3));
				
				vo.getFilename()[0] = rs.getString(4);
				vo.getFilename()[1] = rs.getString(5);
				
				vo.setHit(rs.getInt(6));
				vo.setDownCount(rs.getInt(7));
				vo.setWritedate(rs.getString(8));
				lst.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("자료실 레코드 전체 선택 에러 발생->");
			e.printStackTrace();
		}finally {
			getClose();
		} 
		return lst;
	}

	@Override
	public void hitCount(int no) {
		 try {
			 getConn();
			 sql = "update data set hit=hit+1 where no=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, no);
			 pstmt.executeUpdate();
			 
			 
			 
		 }catch(Exception e) {
			 System.out.println("자료실 조회수 증가 에러 발생->");
			 e.printStackTrace();
		 }finally {
			 getClose();
		 }

	}

	@Override
	public int downloadCount(int no) {
		int count = 0;
		try {
			getConn();
			//다운로드 회수 증가 : update
			sql = "update data set downcount=downcount+1 where no="+no;
		
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();//처리 끝. 쿼리문 새로 생성 가능.
			
			//DB에 다운로드 회수 구하기 - select
			sql = "select downcount from data where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("다운로드 회수 증가 에러 발생->");
			e.printStackTrace();
		}finally {
			getClose();
		}
		return count;
	}
	
	//레코드 삭제 전 파일명 선택
	public void filenameSelect(DataVO vo) {
		try {
			getConn();
			 
			sql = "select filename1, filename2 from data where no=?"; 
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.getFilename()[0] = rs.getString(1);
				vo.getFilename()[1] = rs.getString(2);
			}
		}catch(Exception e) {
			System.out.println("레코드 삭제 전 파일명 선택 에러 발생->");
			e.printStackTrace();
		}finally {
			getClose();
		}
	}
	
	//레코드의 자료실에서 파일명 선택
	public List<String> getSelectFile(int no){
		//collection 이용하기
		List<String> fileList = new ArrayList<String>();
		try {
			getConn();
			
			sql = "select filename1, filename2 from data where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fileList.add(rs.getString(1));
				if(rs.getString(2)!=null) {
					fileList.add(rs.getString(2));
				}
			}
			
		}catch(Exception e) {
			System.out.println("파일 선택 에러 발생-getSelectFile()->");
			e.printStackTrace();
		}finally {
			getClose();
		}
		
		return fileList;
	}
} 
