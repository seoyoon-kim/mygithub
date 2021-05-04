package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.NoticeDAO;
import com.beetmall.sshj.custom.vo.NoticeVO;

@Service
public class NoticeServiceImp implements NoticeService{
	@Inject
	NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> noticeAllRecord() {
		
		return noticeDAO.noticeAllRecord();
	}

	@Override
	public NoticeVO noticeSelect(int infonum) {
		
		return noticeDAO.noticeSelect(infonum);
	}
	
}
