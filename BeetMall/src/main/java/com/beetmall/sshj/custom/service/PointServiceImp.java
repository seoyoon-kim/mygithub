package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.PointDAO;
import com.beetmall.sshj.custom.vo.PointPageVO;
import com.beetmall.sshj.custom.vo.PointVO;
@Service
public class PointServiceImp implements PointService{
	@Inject
	PointDAO pointDAO;

	@Override
	public List<PointVO> selectPoint(PointPageVO vo) {
		return pointDAO.selectPoint(vo);
	}

	@Override
	public List<PointVO> selectPointType(PointPageVO vo) {
		
		return pointDAO.selectPointType(vo);
	}

	@Override
	public List<PointVO> selectPointMonth(PointPageVO vo) {
		
		return pointDAO.selectPointMonth(vo);
	}

	@Override
	public List<PointVO> selectPointTypeMonth(PointPageVO vo) {
		
		return pointDAO.selectPointTypeMonth(vo);
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

	@Override
	public int countPoint(String userid) {
		
		return pointDAO.countPoint(userid);
	}

}
