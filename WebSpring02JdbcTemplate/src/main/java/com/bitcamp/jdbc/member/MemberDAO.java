package com.bitcamp.jdbc.member;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bitcamp.jdbc.Constants;

public class MemberDAO {
	public JdbcTemplate template;

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public MemberDAO() {
		template = Constants.jdbcTemplate;
	}
	
	//로그인
	public MemberVO loginCheck(MemberVO vo) {
		//select된 값이 반드시 0 이상이다(null이 없다.)
		String sql = "select count(userid) useridCount from register where userid=? and userpwd=?";
		
		//                     select 의 필드명과 vo의 변수명이 같으면 set 한다.
		MemberVO vo2 = template.queryForObject(sql, new BeanPropertyRowMapper<MemberVO>(MemberVO.class), vo.getUserid(), vo.getUserpwd());
		//sql 쿼리문은 여기서 사용이 끝남. 아래서 다시 세팅 가능
		if(vo2.getUseridCount()>0) {//아이디가 존재하면
			//아이디와 이름을 선택하여 vo를 리턴
			sql = "select userid, username from register where userid=? and userpwd=?";
			//queryForObject : select 할 때 사용, object 리턴
			return template.queryForObject(sql, new BeanPropertyRowMapper<MemberVO>(MemberVO.class), vo.getUserid(), vo.getUserpwd());
		}else {//아이디가 없다
			return null;
		}
	}
	
}
