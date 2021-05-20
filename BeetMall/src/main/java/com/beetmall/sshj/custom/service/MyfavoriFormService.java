package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyfavoriFormVO;

public interface MyfavoriFormService {

	public List<MyfavoriFormVO> myfavoriForm(String logId1);

	public MyfavoriFormVO selectInfo2(int storenum);

	public int selectFavorite2(int storenum);

	public int farmHit(int storenum);

}
