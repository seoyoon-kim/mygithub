package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.ChatVO;
import com.beetmall.sshj.custom.vo.PointPageVO;

public interface ChatService {
	public List<ChatVO> selectChat(PointPageVO vo);
	public int getRecord(String userid);
	public int outRoomSelect(String userid, int roomcode);
	public int chatRoomOut(int roomcode, String usertype);
	public int roomClean();
}
