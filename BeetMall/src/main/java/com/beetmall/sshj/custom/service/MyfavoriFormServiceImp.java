package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.CategoryDAO;
import com.beetmall.sshj.custom.dao.MyfavoriFormDAO;
import com.beetmall.sshj.custom.vo.MyfavoriFormVO;

@Service
public class MyfavoriFormServiceImp implements MyfavoriFormService{
	
	@Inject
	MyfavoriFormDAO myfavoriFormDAO;

	public List<MyfavoriFormVO> myfavoriForm(String logId1) {
		return myfavoriFormDAO.myfavoriForm(logId1);
	}
	
}
