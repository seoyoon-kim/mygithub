package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class DataDelCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	 DataVO vo = new DataVO();
	 vo.setNo(Integer.parseInt(req.getParameter("no")));
	 vo.setUserid((String)req.getSession().getAttribute("userid"));
	 
	 DataDAO dao = new DataDAO();
	 
	 //1.DB 파일명 정보를 먼저 선택해 보관한다
	 dao.filenameSelect(vo);
	 
	 //2.레코드 지우기
	int cnt = dao.dataDelect(vo);
	
	//3.레코드 삭제 성공한 경우에 파일 삭제
	if(cnt>=1) {
		//삭제할 파일의 절대 경로 구하기
		String path = req.getServletContext().getRealPath("/upload");
		
		for(String dbFile:vo.getFilename()) {
			if(dbFile!=null && !dbFile.equals("")) {
				try {
					File f = new File(path, dbFile);//경로, 파일명
					f.delete();//삭제
				}catch(Exception e) {
					System.out.println("파일 삭제 에러 발생->");
					e.printStackTrace();
				}
			}
		}
	}
	req.setAttribute("cnt", cnt);
	 return "/data/delOk.jsp";
	}

}
