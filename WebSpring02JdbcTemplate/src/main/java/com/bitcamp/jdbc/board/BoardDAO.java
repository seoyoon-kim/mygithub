package com.bitcamp.jdbc.board;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bitcamp.jdbc.Constants;

public class BoardDAO implements BoardDAOImp{
	public JdbcTemplate template; //변수 선언
	public JdbcTemplate getTemplate() { //getter, setter
		return template;
	} 
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public BoardDAO() {
		template = Constants.jdbcTemplate;
	}
	
	public List<BoardVO> boardAllRecord(){
		String sql = "select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from board order by no desc";
		//쿼리문, select 쿼리문을 실행하여 vo에 데이터를 세팅하고 List에 vo 객체를 추가하여 리턴한다.  
		return template.query(sql, new BeanPropertyRowMapper<BoardVO>(BoardVO.class)); 
	}
	
	@Override
	public BoardVO boardOneRecord(int no) {
		String sql = "select no, subject, content, userid, hit, writedate from board where no=?";
		//queryForObject()sql, object, bean)
		//다음 object는 이것과 같다 : Object[] a = new Object[1]; a[0] = no; 
		return template.queryForObject(sql,new Object[] {no}, new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
		
	}

	@Override
	public int boardInsertRecord(final BoardVO vo) {
		try {
		String sql = "insert into board(no, subject, userid, content, ip)"
				 +" values(boardsq.nextval, ?,?,?,?)";
		 //int type으로 리턴 = template.update(sql, vo.getSubject()(= 첫번째 ?의 값), vo.getUserid(), vo.getContent(), vo.getIp()); 
		return template.update(sql, new PreparedStatementSetter() { //pss 클래스 이용, int return

			 //익명의 내부 클래스
			 @Override
			public void setValues(PreparedStatement ps) throws SQLException {
				 ps.setString(1, vo.getSubject());
				 ps.setString(2, vo.getUserid());
				 ps.setString(3, vo.getContent());
				 ps.setString(4, vo.getIp()); 
			} 
		 });  
		}catch(Exception e) {
			System.out.println("글쓰기 에러 발생->");
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int boardUpdateRecord(BoardVO vo) {
		String sql = "update board set subject=?, content=? where no=? and userid=?";
		return template.update(sql, vo.getSubject(), vo.getContent(), vo.getNo(), vo.getUserid()); 
	}

	@Override
	public int boardDeleteRecord(final int no, final String userid) {
		String sql = "delete from board where no=? and userid=?";
		return template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1,  no);
				ps.setString(2,  userid);
			}
		}); 
	}

	@Override
	public void hitCount(int no) {
		 String sql = "update board set hit=hit+1 where no=?";
		 template.update(sql, no);//update는 int를 리턴하나 , 여기서는 리턴값이 필요없다
	}

}
