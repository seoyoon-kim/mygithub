package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.admin.vo.csQBrowseVO;

public interface CsQBrowseService {

	public List<csQBrowseVO> csQBrowseList(adminkPageSearchVO pageVO);

	public int csQBrowseOnetotalRecord(adminkPageSearchVO pageVO);

	public csQBrowseVO csQOpenSelect(int qnum);

}
