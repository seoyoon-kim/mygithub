package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> noticeAllRecord();
	public NoticeVO noticeSelect(int infonum);
}
