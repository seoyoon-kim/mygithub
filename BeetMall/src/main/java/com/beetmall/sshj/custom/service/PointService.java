package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.PointPageVO;
import com.beetmall.sshj.custom.vo.PointVO;

public interface PointService {
	public List<PointVO> selectPoint(PointPageVO vo);
	public List<PointVO> selectPointType(PointPageVO vo);
	public List<PointVO> selectPointMonth(PointPageVO vo);
	public List<PointVO> selectPointTypeMonth(PointPageVO vo);
	public int countPoint(String userid);
	public int countPointType(String userid, String type);
	public int countPointMonth(String userid, int month);
	public int countPointTypeMonth(String userid, String type, int month);
	public int myPointView(String userid);
	
}
