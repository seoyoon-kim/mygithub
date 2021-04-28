package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CenterDAO;
import com.beetmall.sshj.custom.dao.MemberDAO;
import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.MemberVO;

@Service
public class CenterServiceImp implements CenterService{

	@Inject
	CenterDAO centerDAO;
	
	@Override
	public int centerWrite(CenterVO vo) {
		return centerDAO.centerWrite(vo);
	}

	public List<CenterVO> centerAllRecord() {
		
		return centerDAO.centerAllRecord();
	}

	public CenterVO centerSelect(int qmnum) {
		return centerDAO.centerSelect(qmnum);
	}
	
	public int centerDelete(int qmnum) {
		return centerDAO.centerDelete(qmnum);
	}

	public int centerEditOk(CenterVO vo) {
		return centerDAO.centerEditOk(vo);
	}

}
