package com.beetmall.sshj.custom.service;

import com.beetmall.sshj.custom.vo.CenterVO;

public interface CenterService {
	
	//1:1문의하기 글쓰기 view: customerCenterWrite
	public int centerWrite(CenterVO vo);
	
}
