package com.bitcamp.myapp.dao;

import org.apache.ibatis.annotations.Select;

import com.bitcamp.myapp.vo.MemberVO;

public interface MemberDAO {
	//어노테이션을 이용해 메서드 정의 전에 쿼리문 작성(if문은 안됨.java에서 가능)              ${userid} : growth->필드임 / #{userid}: 'growth'->데이터임
	@Select("select userid, username from register where userid=#{userid} and userpwd=#{userpwd}")
	public MemberVO login(MemberVO vo);
	
}
