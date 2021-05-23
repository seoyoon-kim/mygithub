package com.beetmall.sshj.admin.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.beetmall.sshj.admin.controller.Constants;
import com.beetmall.sshj.admin.service.admin_DataDAOImpl;
import com.beetmall.sshj.admin.vo.admin_DataVO;

public class admin_DataDAO implements admin_DataDAOImpl {
 public JdbcTemplate template;
 public admin_DataDAO() {
	 template = Constants.jdbcTemplate;
 }
  
	@Override
	public admin_DataVO dataSelect(int no) {
		String sql = "select no, title, content, userid, hit, downCount, writedate, filename1, filename2"
					 +" from data where no=?";
		return template.queryForObject(sql, new BeanPropertyRowMapper<admin_DataVO>(admin_DataVO.class), no);
	
	}
	@Override
	public admin_DataVO getSelectFilename(int no) {
		String sql = "select filename1, filename2 from data where no=?";
		return template.queryForObject(sql, new BeanPropertyRowMapper<admin_DataVO>(admin_DataVO.class), no);
	 }
	@Override
	public int dataUpdate(admin_DataVO vo) {
		String sql = "update data set title=?, content=?, filename1=? where no=? and userid=?"; 
		return template.update(sql, vo.getTitle(), vo.getContent(), vo.getFilename1(), vo.getFilename2(), vo.getNo(), vo.getUserid());
	}
		
}
