package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface adminProductDAO {

	public List<adminProductVO> productList(adminkPageSearchVO pageVO);

	public int productOnetotalRecord(adminkPageSearchVO pageVO);

}
