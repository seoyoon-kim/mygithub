package com.beetmall.sshj.admin.dao;

import java.util.List;

import com.beetmall.sshj.admin.vo.CsQuestionVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

public interface CsQuestionDAO {

	public List<CsQuestionVO> csQuestList(adminkPageSearchVO pageVO);

	public int csQuestOnetotalRecord(adminkPageSearchVO pageVO);

	public CsQuestionVO csAnswerWrite(int qmnum);

	public int csAnswerWriteOk(CsQuestionVO vo);
}
