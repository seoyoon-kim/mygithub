package com.beetmall.sshj.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.beetmall.sshj.admin.dao.CsQuestionDAO;

@Service
public class CsQuestionServiceImp implements CsQuestionService {
	@Inject
	CsQuestionDAO csquestionDAO;
}
