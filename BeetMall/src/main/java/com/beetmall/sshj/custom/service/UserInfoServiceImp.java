package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.UserInfoDAO;
import com.beetmall.sshj.custom.vo.UserInfoVO;

@Service
public class UserInfoServiceImp implements UserInfoService{
	@Inject
	UserInfoDAO userInfoDAO;

	@Override
	public List<UserInfoVO> infobusiz() {
		return userInfoDAO.infobusiz();
	}

	@Override
	public List<UserInfoVO> infomaition() {
		return userInfoDAO.infomaition();
	}

	@Override
	public List<UserInfoVO> personaal() {
		return userInfoDAO.personaal();
	}
}
