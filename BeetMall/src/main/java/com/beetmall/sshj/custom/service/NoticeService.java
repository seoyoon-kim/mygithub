package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.NoticeVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface NoticeService {

	public List<NoticeVO> noticeAllRecord(PageSearchVO pageVO);

	public NoticeVO noticeSelect(int infonum);

	public int noticeHit(int infonum);

	public int noticeOnetotalRecord(PageSearchVO pageVO);

}
