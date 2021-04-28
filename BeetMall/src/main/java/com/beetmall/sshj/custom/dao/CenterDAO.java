package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CenterVO;

public interface CenterDAO {

	public int centerWrite(CenterVO vo);

	public List<CenterVO> centerAllRecord();

	public CenterVO centerSelect(int qmnum);

	public int centerDelete(int qmnum);

	public int centerEditOk(CenterVO vo);

}
