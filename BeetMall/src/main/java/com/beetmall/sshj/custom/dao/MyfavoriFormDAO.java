package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyfavoriFormVO;

public interface MyfavoriFormDAO {

	public List<MyfavoriFormVO> myfavoriForm(String logId);

	public MyfavoriFormVO selectInfo2(int storenum);

	public int selectFavorite2(int storenum);

	public int farmHit(int storenum);

}
