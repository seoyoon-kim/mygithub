package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.admin_DataVO;

public interface admin_DataDAOImpl {
 
	//파일 선택
	public admin_DataVO dataSelect(int no);
	//파일명 선택
	public admin_DataVO getSelectFilename(int no);
	//레코드 수정
	public int dataUpdate(admin_DataVO vo);
	//레코드 삭제
	public int dataDelete(int no, String userid);
	
}
