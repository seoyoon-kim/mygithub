package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CustomInfoDAO;
import com.beetmall.sshj.custom.vo.CustomInfoVO;
import com.beetmall.sshj.custom.vo.PageProductVO;

@Service
public class CustomInfoServiceImp implements CustomInfoService {

	@Inject
	CustomInfoDAO customInfoDAO;
	

	@Override
	public int CustomInfoWrite(CustomInfoVO vo) {
		// TODO Auto-generated method stub
		return customInfoDAO.CustomInfoWrite(vo);
	}

	@Override
	public List<CustomInfoVO> CustomInfoAllRecord(PageProductVO pageVO2) {
		// TODO Auto-generated method stub
		return customInfoDAO.CustomInfoAllRecord(pageVO2);
	}

	@Override
	public CustomInfoVO CustomInfoSelect(int qnum) {
		// TODO Auto-generated method stub
		return customInfoDAO.CustomInfoSelect(qnum);
	}

	@Override
	public int totalRecord8(String userid) {
		
		return customInfoDAO.totalRecord8(userid);
	}

	public int lockinfo(int num) {
		return customInfoDAO.lockinfo(num);
		
	}

}
