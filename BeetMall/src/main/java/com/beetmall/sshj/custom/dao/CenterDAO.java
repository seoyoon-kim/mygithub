package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CenterVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface CenterDAO {

	public int centerWrite(CenterVO vo);

	public List<CenterVO> centerAllRecord(PageSearchVO pageVO);

	public CenterVO centerSelect(int qmnum);

	public int centerDelete(int qmnum);

	public int centerEditOk(CenterVO vo);

	public int centerOnetotalRecord(PageSearchVO pageVO);

}
