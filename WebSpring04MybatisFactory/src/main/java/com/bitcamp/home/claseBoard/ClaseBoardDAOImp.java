package com.bitcamp.home.claseBoard;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface ClaseBoardDAOImp { 
	 
	public int claseInsert(ClaseBoardDTO dto); //글쓰기
	public List<ClaseBoardDTO> claseAllRecord(); //레코드 전부 선택(목록보기) 
	public ClaseBoardDTO claseSelect(int no);//레코드 1 선택
	public int hitCount(int no); //조회수
	public ClaseBoardDTO oriInfor(int no);	//원글의 ref, step, lvl을 선택
	public int lvlCount(ClaseBoardDTO dto);//lvl 증가
	public int claseDataInsert(ClaseBoardDTO dto);//답글쓰기
	public int getTotalRecord();//총 레코드 수 구하기
	public int claseUpdate(ClaseBoardDTO dto);//답변형 글수정
	public ClaseBoardDTO getStep(int no); //step 0인지 확인= 삭제 위한 원글확인, step, userid 가져오기
	public int claseDelete(int no);//원글 삭제
	public int claseDeleteUpdate(int no, String userid);//답글 삭제
	public PrevNextVO lagLeadSelect(int no);//이전글 다음글
}
