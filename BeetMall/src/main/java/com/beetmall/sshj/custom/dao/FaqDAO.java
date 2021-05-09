package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.FaqVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface FaqDAO {

	public List<FaqVO> faqAllRecord(PageSearchVO pageVO);

	public int faqOnetotalRecord(PageSearchVO pageVO);
}
