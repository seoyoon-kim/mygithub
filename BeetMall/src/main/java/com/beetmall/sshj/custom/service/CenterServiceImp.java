package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CenterDAO;
import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

@Service
public class CenterServiceImp implements CenterService{

	@Inject
	CenterDAO centerDAO;
	
	@Override
	public int centerWrite(CenterVO vo) {
		return centerDAO.centerWrite(vo);
	}

	public List<CenterVO> centerAllRecord(PageSearchVO pageVO) {
		
		return centerDAO.centerAllRecord(pageVO);
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

	public int centerOnetotalRecord(PageSearchVO pageVO) {
		return centerDAO.centerOnetotalRecord(pageVO);
	}

}
