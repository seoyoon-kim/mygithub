package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataEditOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//1.req객체
		//2. 서버에 업로드될 위치 절대경로  
		String path = req.getServletContext().getRealPath("/upload"); 
		//3. 파일 maxSize(byte단위)  
		//4. encoding 문자열로 작성
		//5. 파일이름바꾸기 정보  						            //maxSize
		MultipartRequest mr = new MultipartRequest(req, path, 1024*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		///파일 수정 - 새 파일 업로드 완료됨
		DataDAO dao = new DataDAO();
		DataVO vo = new DataVO();
		vo.setNo(Integer.parseInt(mr.getParameter("no")));//글 번호
		vo.setTitle(mr.getParameter("title"));//제목
		vo.setContent(mr.getParameter("content"));//내용
		vo.setUserid((String)req.getSession().getAttribute("userid"));
		
		vo.setDelfile(mr.getParameterValues("delfile"));//삭제된 파일 정보
		System.out.println("삭제된 파일 개수 확인 : "+vo.getDelfile().length);
		
		for(int i=0; i<vo.getDelfile().length; i++) {
			System.out.println("자료실에서 삭제한 파일["+i+"]=>"+vo.getDelfile()[i]);
		}
		//새로 업로드된 파일정보
		Enumeration nameList= mr.getFileNames();//필드명
		int idx=0;
		while(nameList.hasMoreElements()) {//필드명만큼 바복
			String fieldName = (String)nameList.nextElement();//필드명 구하기
			if(mr.getFilesystemName(fieldName)!=null) {
				vo.getFilename()[idx++] = mr.getFilesystemName(fieldName);//새로 업로드 된 파일 정보
			}
		}
		//데이터베이스의 파일명 얻어오기
		List<String> dbFile = dao.getSelectFile(vo.getNo());//디비에서 새로 읽어온 파일 정보
		//db파일 중에 삭제된 파일(0~2개) 지우기
		if(vo.getDelfile()!=null) {	
			for(int delIdx = 0; delIdx<vo.getDelfile().length; delIdx++) {
				dbFile.remove(vo.getDelfile()[delIdx]);
			}
		}
		//새로 업로드한 파일을 dbFile에 추가
		for(int i=0; i<idx; i++) {
			//if(vo.getFilename()[i]!=null) {
			dbFile.add(vo.getFilename()[i]);
			//}
		}
		for(int ii=0; ii<dbFile.size(); ii++) {
			System.out.println("새로 추가한 파일 list->"+dbFile.get(ii));
		}
		
		//레코드 수정
		int result = dao.dataUpdate(vo, dbFile);
		//DB에서 삭제한 파일을 서버에서도 제거
		if(vo.getDelfile()!=null) {
			for(int k=0; k<vo.getDelfile().length; k++) {
				try {
					File delFile = new File(path, vo.getDelfile()[k]);
					delFile.delete();
				}catch(Exception e) {
					System.out.println("DB에서 파일 삭제 후 서버에서 파일 삭제 에러 발생->");
					e.printStackTrace();
				}
			}
		}
		
		//DB값을 req에 가져와 심는다
		req.setAttribute("result", result);
		req.setAttribute("no", vo.getNo());
		return "/data/dataEditOk.jsp";
	}

}
