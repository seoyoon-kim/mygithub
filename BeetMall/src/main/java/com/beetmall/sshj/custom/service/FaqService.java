package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.FaqVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface FaqService {

	public List<FaqVO> faqAllRecord(PageSearchVO pageVO);

	public int faqOnetotalRecord(PageSearchVO pageVO);

}
