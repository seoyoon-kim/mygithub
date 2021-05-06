package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CustomInfoVO;

public interface CustomInfoDAO {

	public int CustomInfoWrite(CustomInfoVO vo);

	public List<CustomInfoVO> CustomInfoAllRecord();

	public CustomInfoVO CustomInfoSelect(int qnum);
	
}
