package com.beetmall.sshj.admin.service;

import java.util.List;

import com.beetmall.sshj.admin.vo.CsQuestionVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface CsQuestionService {

	public List<CsQuestionVO> csQuestList(adminkPageSearchVO pageVO);

	public int csQuestOnetotalRecord(adminkPageSearchVO pageVO);

	public CsQuestionVO csAnswerWrite(int qmnum);

	public int csAnswerWriteOk(CsQuestionVO vo);

}
