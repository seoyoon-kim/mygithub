package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.CsQBrowseDAO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;
import com.beetmall.sshj.admin.vo.csQBrowseVO;

@Service
public class CsQBrowseServiceImp implements CsQBrowseService{
	
	@Inject
	CsQBrowseDAO csQBrowseDAO;
	
	@Override
	public List<csQBrowseVO> csQBrowseList(adminkPageSearchVO pageVO) {
		return csQBrowseDAO.csQBrowseList(pageVO);
	}

	@Override
	public int csQBrowseOnetotalRecord(adminkPageSearchVO pageVO) {
		// TODO Auto-generated method stub
		return csQBrowseDAO.csQBrowseOnetotalRecord(pageVO);
	}

	@Override
	public csQBrowseVO csQOpenSelect(int qnum) {
		return csQBrowseDAO.csQOpenSelect(qnum);
	}

}
