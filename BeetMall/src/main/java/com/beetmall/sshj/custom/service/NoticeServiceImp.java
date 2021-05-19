package com.beetmall.sshj.custom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.custom.dao.NoticeDAO;
import com.beetmall.sshj.custom.vo.NoticeVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

@Service
public class NoticeServiceImp implements NoticeService{
	@Inject
	NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> noticeAllRecord(PageSearchVO pageVO) {
		return noticeDAO.noticeAllRecord(pageVO);
	}

	@Override
	public NoticeVO noticeSelect(int infonum) {
		return noticeDAO.noticeSelect(infonum);
	}

	@Override
	public int noticeHit(int infonum) {
		return noticeDAO.noticeHit(infonum);
	}

	@Override
	public int noticeOnetotalRecord(PageSearchVO pageVO) {
		return noticeDAO.noticeOnetotalRecord(pageVO);
	}
	
}
