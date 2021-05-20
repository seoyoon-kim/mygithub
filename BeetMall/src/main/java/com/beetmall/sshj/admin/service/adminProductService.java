package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.adminProductVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface adminProductService {

	public List<adminProductVO> productList(adminkPageSearchVO pageVO);

	public int productOnetotalRecord(adminkPageSearchVO pageVO);

}
