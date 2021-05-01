package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.FaqDAO;
import com.beetmall.sshj.custom.vo.FaqVO;

@Service
public class FaqServiceImp implements FaqService {
	@Inject
	FaqDAO faqDAO;
	
	@Override
	public List<FaqVO> faqAllRecord() {
		return faqDAO.faqAllRecord();
	}

}
