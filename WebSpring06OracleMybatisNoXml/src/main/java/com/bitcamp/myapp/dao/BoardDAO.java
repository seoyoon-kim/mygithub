package com.bitcamp.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitcamp.myapp.vo.BoardVO;

public interface BoardDAO {
	@Select("select no, subject, userid, hit, to_char(writedate,'MM-DD HH-MI') writedate from board")
	public List<BoardVO> allList(String searchKey, String searchWord);
	 
	"select no, subject, userid, hit, to_char(writedate,'MM-DD HH-MI') writedate from (select * from (select no, subject, userid, hit, to_char(writedate,'YY-MM-DD HH:MI') writedate from board";
	 		//검색어가 있을 경우
	if(searchWord!=null && !searchWord.equals("")) {
		" where "+searchKey+" like '%' ||#{searchKey}||'%'"
				+ " and"+searchWord+" like '%'"+#{subject}+" or"+#{userid}+or+#{content}  
	}	" order by no desc) "
				+ " where rownum<=? order by no asc)"
				+ " where rownum<=? order by no desc";

	@Select("select no, subject, content, userid, hit, writedate from board where no=#{no}")
	public BoardVO boardSelect(int no);
	
	@Insert("insert into board(no, userid, subject, content, ip) values(boardsq.nextval, #{userid}, #{subject}, #{content}, #{ip})")
	public int boardInsert(BoardVO vo);
	 
}
