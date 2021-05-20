package com.beetmall.sshj.admin.service;

import com.beetmall.sshj.admin.vo.Admin_SalesVO;

public interface Admin_SalesService {
	// 수익 데이터 가져오기
	public Admin_SalesVO getCompaySellerCustomerData(Admin_SalesVO vo);
}
