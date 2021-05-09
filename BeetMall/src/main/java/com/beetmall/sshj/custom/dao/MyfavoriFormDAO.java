package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyfavoriFormVO;

public interface MyfavoriFormDAO {

	public List<MyfavoriFormVO> myfavoriForm(String logId);

	public List<MyfavoriFormVO> myfavoriFormTotal();

}
