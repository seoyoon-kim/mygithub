package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.PointDAO;
import com.beetmall.sshj.custom.vo.PointVO;
@Service
public class PointServiceImp implements PointService{
	@Inject
	PointDAO pointDAO;

	@Override
	public List<PointVO> selectPoint(String userid, int pageView, int lastPage) {
		return pointDAO.selectPoint(userid,pageView, lastPage);
	}

	@Override
	public List<PointVO> selectPointType(String userid, String type) {
		
		return pointDAO.selectPointType(userid, type);
	}

	@Override
	public List<PointVO> selectPointMonth(String userid, int month) {
		
		return pointDAO.selectPointMonth(userid, month);
	}

	@Override
	public List<PointVO> selectPointTypeMonth(String userid, String type, int month) {
		
		return pointDAO.selectPointTypeMonth(userid, type, month);
	}

	@Override
	public int countPointType(String userid, String type) {
		
		return pointDAO.countPointType(userid, type);
	}

	@Override
	public int countPointMonth(String userid, int month) {
		
		return pointDAO.countPointMonth(userid, month);
	}

	@Override
	public int countPointTypeMonth(String userid, String type, int month) {
		
		return pointDAO.countPointTypeMonth(userid, type, month);
	}

	@Override
	public int myPointView(String userid) {
		
		return pointDAO.myPointView(userid);
	}

}
