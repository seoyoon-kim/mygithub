package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.MyfavoriFormVO;

public interface MyfavoriFormService {

	public List<MyfavoriFormVO> myfavoriForm(String logId);

	public List<MyfavoriFormVO> myfavoriFormTotal();

}
