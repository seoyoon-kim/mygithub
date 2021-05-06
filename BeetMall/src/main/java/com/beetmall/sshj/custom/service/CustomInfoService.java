package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.CustomInfoVO;


public interface CustomInfoService {

	public int CustomInfoWrite(CustomInfoVO vo);

	public List<CustomInfoVO> CustomInfoAllRecord();

	public CustomInfoVO CustomInfoSelect(int qnum);
	
}
