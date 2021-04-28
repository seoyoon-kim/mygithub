package com.beetmall.sshj.custom.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.CenterServiceImp;
import com.beetmall.sshj.custom.vo.CenterVO;
import com.google.gson.JsonObject;

////관리자에게 문의하기 VO=CenterVO
@Controller
public class CenterController {
	
	@Inject
	CenterServiceImp centerService;
	
	//1:1문의 글쓰기
	@RequestMapping(value="/cusomerCenterWriteOk", method=RequestMethod.POST)
	public ModelAndView cusomerCenterWrite(CenterVO vo, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int result = centerService.centerWrite(vo);
		if(result>0) {
			mav.setViewName("redirect:customerCenter");
		}else {
			mav.setViewName("redirect:customerCenterWrite");
		}
		return mav;
	}
	@RequestMapping("/customerCenter")
	public ModelAndView qmboardList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",centerService.centerAllRecord());
		mav.setViewName("custom/customerCenter/customerCenter");
		return mav;
	}
	
	///////////////////////////서머노트 이미지업로드부분//////////////////////////////////////////////
	//서머노트 이미지업로드부분
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	////////////////////////////////////////////////////////////////////////////////////
}
