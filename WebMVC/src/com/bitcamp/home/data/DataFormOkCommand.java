package com.bitcamp.home.data;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataFormOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//파일 업로드할 서버위치의 절대경로 구하기
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("파일 업로드 서버 path->"+path);
		//1.req객체
		//2. 서버에 업로드될 위치 절대경로 
		//3. 파일 maxSize(byte단위) 
		int maxSize = 1024*1024*1024; //1기가
		//4. encoding 문자열로 작성
		//5. 파일이름바꾸기 정보
		DefaultFileRenamePolicy policy= new DefaultFileRenamePolicy();
		//form의 데이터와 file 업로드 완료
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", policy);
		
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		HttpSession ses = req.getSession();
		vo.setUserid((String)ses.getAttribute("userid"));
		
		vo.setIp(req.getRemoteAddr());
		
		//폼의 type = "file" 태그의 name 속성 값을 구한다
		Enumeration fileList = mr.getFileNames(); //filename1, filename2
		int idx = 0;
		
		while(fileList.hasMoreElements()) {
			//System.out.println(fileList.nextElement());
			String nameAttr = (String)fileList.nextElement();//필드명
			String newFilename = mr.getFilesystemName(nameAttr);//파일명 얻어오기(새롭게 정해진 파일명)
								//mr.getOriginalFileName(nameAttr); //원래의 파일명 얻어오기
				
			////////////////////////////////////////
			if(newFilename != null) {
				vo.getFilename()[idx++] = newFilename;
			}
		}
		
		DataDAO dao = new DataDAO();
		int cnt = dao.dataInsert(vo);
		
		//레코드 추가(글 업로드) 실패시, 이미 업로드된 파일 삭제하기
		if(cnt<=0) {
			for(String delFile: vo.getFilename()) {
				if(delFile !=null) {
					try {
						File f = new File(path, delFile); //경로, 파일
						f.delete();
				
					}catch(Exception e) {
						System.out.println("파일 삭제 에러 발생->");
						e.printStackTrace();
					}
				}
			}
		}
		req.setAttribute("cnt", cnt);
		return "/data/dataFormOk.jsp";
	}

}
