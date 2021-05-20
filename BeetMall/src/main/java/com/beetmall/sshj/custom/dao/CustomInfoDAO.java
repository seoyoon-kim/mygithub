package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CustomInfoVO;
import com.beetmall.sshj.custom.vo.PageProductVO;

public interface CustomInfoDAO {

	public int CustomInfoWrite(CustomInfoVO vo);

	public List<CustomInfoVO> CustomInfoAllRecord(PageProductVO pageVO2);

	public CustomInfoVO CustomInfoSelect(int qnum);
	
	public int totalRecord8(String userid);

	public int lockinfo(int num);

}
