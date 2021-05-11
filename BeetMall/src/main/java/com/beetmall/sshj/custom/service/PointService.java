package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.PointVO;

public interface PointService {
	public List<PointVO> selectPoint(String userid, int pageView, int lastPage);
	public List<PointVO> selectPointType(String userid, String type);
	public List<PointVO> selectPointMonth(String userid, int month);
	public List<PointVO> selectPointTypeMonth(String userid, String type, int month);
}
