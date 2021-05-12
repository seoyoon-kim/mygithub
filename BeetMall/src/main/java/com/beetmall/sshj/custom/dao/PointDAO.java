package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.PointVO;

public interface PointDAO {
	public List<PointVO> selectPoint(String userid, int pageView, int lastPage);
	public List<PointVO> selectPointType(String userid, String type);
	public List<PointVO> selectPointMonth(String userid, int month);
	public List<PointVO> selectPointTypeMonth(String userid, String type, int month);
	public List<PointVO> countPointType(String userid, String type);
	public List<PointVO> countPointMonth(String userid, int month);
	public List<PointVO> countPointTypeMonth(String userid, String type, int month);
	

}
