package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeAllRecord();

	public NoticeVO noticeSelect(int infonum);

}
