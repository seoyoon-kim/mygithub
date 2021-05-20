package com.beetmall.sshj.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.CsQuestionDAO;
import com.beetmall.sshj.admin.vo.CsQuestionVO;
import com.beetmall.sshj.admin.vo.adminkPageSearchVO;

@Service
public class CsQuestionServiceImp implements CsQuestionService {
	@Inject
	CsQuestionDAO csquestionDAO;

	@Override
	public List<CsQuestionVO> csQuestList(adminkPageSearchVO pageVO) {
		// TODO Auto-generated method stub
		return csquestionDAO.csQuestList(pageVO);
	}

	@Override
	public int csQuestOnetotalRecord(adminkPageSearchVO pageVO) {
		return csquestionDAO.csQuestOnetotalRecord(pageVO);
	}

	@Override
	public CsQuestionVO csAnswerWrite(int qmnum) {
		return csquestionDAO.csAnswerWrite(qmnum);
	}

	@Override
	public int csAnswerWriteOk(CsQuestionVO vo) {
		return csquestionDAO.csAnswerWriteOk(vo);
	}
}
