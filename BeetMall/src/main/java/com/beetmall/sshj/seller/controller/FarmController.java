package com.beetmall.sshj.seller.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.FarmService;
import com.beetmall.sshj.seller.vo.FarmVO;


@Controller
public class FarmController {
	@Autowired
	FarmService service;
	
	@RequestMapping("/seller_sales")
	public ModelAndView seller_sales() {
		ModelAndView mav = new ModelAndView();
		
		// 카테고리 리스트를 불러와서 리스트에 담는다
		mav.addObject("cateList",service.allCategoryList());		
		mav.setViewName("seller/seller_sales");
		return mav;
	}
	
	@RequestMapping("/seller_review")
	public String seller_review() {
		return "seller/seller_review";
	}

	
	@RequestMapping("/edit_farm")
	public String edit_farm() {
		return "seller/edit_farm";
	}

	@RequestMapping("/getListData") // seller_sales 페이지에서 차트와 엑셀 데이터 가져오는 dao
	@ResponseBody
	public List<FarmVO> getListData(FarmVO vo,HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		return service.salesDataList(vo);
	}
	
	@RequestMapping("/excel_down")
	@ResponseBody
	public void excel_down(HttpServletRequest req) {
		String[] excelData = req.getParameterValues("excelData");
		int i = 0;
		// 엑셀파일 생성
		XSSFWorkbook xssfwb =  new XSSFWorkbook();
			// 폰트설정
			XSSFFont font = xssfwb.createFont();
			font.setFontName("나눔고딕");
			font.setFontHeightInPoints((short)24);
			font.setBold(true);
			
			// 셀 스타일
			CellStyle style = xssfwb.createCellStyle();
			style.setFont(font);
			style.setFillForegroundColor(IndexedColors.AQUA.getIndex());
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			style.setVerticalAlignment(VerticalAlignment.CENTER);
			style.setAlignment(HorizontalAlignment.CENTER);
		
		// 시트생성
		XSSFSheet xssfsheet = xssfwb.createSheet("BEETMALL 매출관리");
		// 컬럼 넓이 설정
		xssfsheet.setColumnWidth(0, 6000);
		xssfsheet.setColumnWidth(1, 6000);
		xssfsheet.setColumnWidth(2, 6000);
		xssfsheet.setColumnWidth(3, 6000);
		xssfsheet.setColumnWidth(4, 6000);
		xssfsheet.setColumnWidth(5, 6000);
		
		// 0 ~ 1행 : 2개 행,  0 ~ 5열 : 6개 까지 병합한다.
		xssfsheet.addMergedRegion(new CellRangeAddress(0,1,0,5));
		xssfsheet.autoSizeColumn(100);
		
		// 타이틀 생성
		XSSFRow xssfrow = xssfsheet.createRow(i++);
		XSSFCell xssfcell = xssfrow.createCell(0);
		xssfcell.setCellStyle(style);
		xssfcell.setCellValue("BEETMALL 매출내역");
		
		xssfsheet.createRow(i++);
		xssfrow = xssfsheet.createRow(i++); // 빈행 추가
			
			//테이블 폰트 설정
			XSSFFont tableFont = xssfwb.createFont();
			tableFont.setFontHeightInPoints((short)14);
			tableFont.setFontName("나눔고딕");
			
		// 테이블 스타일 설정
		CellStyle tableStyle = xssfwb.createCellStyle();
		tableStyle.setAlignment(HorizontalAlignment.CENTER);
		tableStyle.setFont(tableFont);
		tableStyle.setBorderBottom(BorderStyle.THIN);
		tableStyle.setBorderLeft(BorderStyle.THIN);
		tableStyle.setBorderRight(BorderStyle.THIN);
		tableStyle.setBorderTop(BorderStyle.THIN);
		
		xssfrow = xssfsheet.createRow(i++);
		xssfcell = xssfrow.createCell(0);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("상품번호");
		xssfcell = xssfrow.createCell(1);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("매출일자");
		xssfcell = xssfrow.createCell(2);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("상품명");
		xssfcell = xssfrow.createCell(3);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("수량");
		xssfcell = xssfrow.createCell(4);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("단가");
		xssfcell = xssfrow.createCell(5);
		xssfcell.setCellStyle(tableStyle);
		xssfcell.setCellValue("매출금액");
		
		for(int index = 0; index < (excelData.length/6); index++) {
			xssfrow = xssfsheet.createRow(i++);// 한 행을 만든다.
			if(index==0) {
				for(int j = 0; j < 6; j++) {// 엑셀 데이터를 한 행에 6개씩 넣는다.
					xssfcell = xssfrow.createCell(j);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(excelData[j]);
				}
			}else {
				for(int j = 0; j < 6; j++) {// 엑셀 데이터를 한 행에 6개씩 넣는다.
					xssfcell = xssfrow.createCell(j);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(excelData[(6*index)+j]);
				}
			}
		}
		File file = new File(System.getProperty("user.home")+"/Downloads/BEETMALL 매출관리.xlsx");
		try {
			// file의 경로로 엑셀 outputStream
			FileOutputStream fos = new FileOutputStream(file);
			// 파일출력
			xssfwb.write(fos);
			fos.close();
			System.out.println("엑셀파일 생성 성공");
		} catch(Exception e) {
			System.out.println("엑셀파일 생성 오류");
			e.printStackTrace();
		}
		
	}
	
}