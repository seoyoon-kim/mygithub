package com.beetmall.sshj.seller.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SellerSettleService;
import com.beetmall.sshj.seller.vo.SellerSettleVO;

@Controller
public class SellerSettleController {
	
	@Autowired
	SellerSettleService service;
	
	@RequestMapping("/sellerSettle")
	public String settlement() {
		return "seller/sellerSettle";
	}
	
	// 주문건별 매출일자 검색
	@RequestMapping(value = "/sellerSettleSearchingData",method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Object> searchingData(HttpServletRequest req,SellerSettleVO vo) {
		// 기본 설정
		vo.setUserid((String)req.getSession().getAttribute("logId"));

		// 페이지로 보낼 array 데이터
		ArrayList<Object> sendData = new ArrayList<Object>();

		// 조회기준이 날짜 기준일때, 매출일자와 정산날짜 기준인지 확인
		if(req.getParameter("selectBtnCheck").equals("날짜")) { 
			List<SellerSettleVO> listData ;
			
			
			int totalMoney = 0;
			if( req.getParameter("selectOption").equals("매출일자")) { // 매출일자일때 totalmoney를 구한다.
				
				List<SellerSettleVO> vo3 = service.getDateDataTotalRecord(vo);
				for(int i = 0 ; i < vo3.size(); i++) {
					int realPayResult = (int) vo3.get(i).getRealpayment();
					
					totalMoney += Math.round(realPayResult - (realPayResult*0.05) - (realPayResult*0.058));
					
				}
				vo.setTotalRecord(vo3.size());
				
				listData = service.getDateData(vo);
			} else { // 정산날짜 일때 totalmoney를 구한다.
				
				List<SellerSettleVO> vo3 = service.getSettleDataTotalRecord(vo);
				for(int i = 0 ; i < vo3.size(); i++) {
					int realPayResult = (int) vo3.get(i).getRealpayment();
					if(vo3.get(i).getSettledate()==null) {
						// settleDate가 null 이면 정산이 된 상품이 아니기 때문에
						// totalMoney에 더하지 않는다.
						continue;
					}
					
					totalMoney += Math.round(realPayResult - (realPayResult*0.05) - (realPayResult*0.058));
					
				}
				vo.setTotalRecord(vo3.size());
				listData = service.getSettleData(vo);
			}
			
			vo.setTotalMoney(totalMoney);
			
			sendData.add(0, vo);
			sendData.add(1, listData);
			
				
			if(listData.size()==0) {
					
				sendData.add(0,vo);
				sendData.add(1,vo);
			}
		}
		
		
		// 조회기준이 주문건별일때
		if(!req.getParameter("selectBtnCheck").equals("날짜")) {
			// 주문 건별 기준일때, total구하기
			
			
			//매출일자 기준이면 getOrderDateData 실행
			if(req.getParameter("selectOption").equals("매출일자")) {
				List<SellerSettleVO> totalOrder = service.totalOrder(vo); // totalMoney, totalRecord
				if(totalOrder.size() !=0) { // 값이 1이상 있으면 실행된다.
					
					SellerSettleVO vo2 = totalOrder.get(0);
					sendData.add(0,vo2);// array[0]에 totalMoney, totalRecord 보내는 데이터
					// 계산된 값이 있으면 꺼내서 array 2번으로 보내기위해 세팅한다
					vo.setTotalRecord(totalOrder.get(0).getTotalRecord()); 
				} else {
					sendData.add(0, 0); // array[0]보내는 데이터
				}
				sendData.add(1, service.getOrderDateData(vo)); // array[1] vo 데이터를 보낸
			} else { // 정산날짜 기준이면 getOrderSettleData
				// 정산 금액 총 합계 가져오기
				List<SellerSettleVO> totalSettle = service.totalSettle(vo); // totalMoney, totalRecord
				if(totalSettle.size() !=0) { // 값이 1이상 있으면 실행된다.
					SellerSettleVO vo2 = totalSettle.get(0);
					sendData.add(0,vo2);// array[0]에 totalMoney, totalRecord 보내는 데이터
					// 계산된 값이 있으면 꺼내서 array 2번으로 보내기위해 세팅한다
					vo.setTotalRecord(totalSettle.get(0).getTotalRecord()); 
				} else {
					sendData.add(0, 0); // array[0]보내는 데이터
				}
				sendData.add(1, service.getOrderSettleData(vo)); //
			}
		}
		
		
		
		
		sendData.add(2, vo);
		

		return sendData;
	}
	
	
	
	
	// 정산내역 엑셀다운로드
	@RequestMapping(value = "/settle_excelDown",method = RequestMethod.GET)
	@ResponseBody
	public void settle_excelDown(HttpServletRequest req, SellerSettleVO vo) {
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		String selectBtnCheck = req.getParameter("selectBtnCheck"); // 날짜, 주문건별
		String selectOption = req.getParameter("selectOption"); // 매출일자 기준, 정산일자 기준		
		vo.setStartDate(req.getParameter("startdate"));
		vo.setEndDate(req.getParameter("enddate"));

		
		
		
		
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
		XSSFSheet xssfsheet = xssfwb.createSheet("BEETMALL 정산관리");
		

		// 데이터 엑셀 row 만들고 cell에 데이터 넣기
		List<SellerSettleVO> list;
		if(selectBtnCheck.equals("날짜")) {// 버튼이 날짜 기준일때
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
			xssfcell.setCellValue("BEETMALL 정산내역");
			
			xssfsheet.createRow(i++);
			xssfrow = xssfsheet.createRow(i++); // 빈행 추가
				
				//테이블 폰트 설정
				XSSFFont tableFont = xssfwb.createFont();
				tableFont.setFontHeightInPoints((short)14);
				tableFont.setFontName("나눔고딕");
				
			// 테이블 스타일 설정
			CellStyle tableStyle = xssfwb.createCellStyle();
			XSSFDataFormat format = xssfwb.createDataFormat();
			tableStyle.setDataFormat(format.getFormat("#,##0"));
			tableStyle.setAlignment(HorizontalAlignment.CENTER);
			tableStyle.setFont(tableFont);
			tableStyle.setBorderBottom(BorderStyle.THIN);
			tableStyle.setBorderLeft(BorderStyle.THIN);
			tableStyle.setBorderRight(BorderStyle.THIN);
			tableStyle.setBorderTop(BorderStyle.THIN);
			
			
			xssfrow = xssfsheet.createRow(i++);


			
			if(selectOption.equals("매출일자")) { // 매출일자 기준일때
				xssfcell = xssfrow.createCell(0);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("매출일자");
				
				xssfcell = xssfrow.createCell(1);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("주문금액");
				
				xssfcell = xssfrow.createCell(2);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("실결제금액");
				
				xssfcell = xssfrow.createCell(3);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("결제수수료");
				
				xssfcell = xssfrow.createCell(4);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("이용수수료");
				
				xssfcell = xssfrow.createCell(5);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("정산금액");
				
				
				list = service.getDateDataTotalRecord(vo);
				
				for(int index = 0; index < list.size(); index++) {
					xssfrow = xssfsheet.createRow(i++);// 한 행을 만든다.
					// 엑셀 데이터를 한 행에 8개씩 넣는다.
					SellerSettleVO listData = list.get(index);
						
					xssfcell = xssfrow.createCell(0);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrderdate());
					
					xssfcell = xssfrow.createCell(1);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrderprice());
					
					xssfcell = xssfrow.createCell(2);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getRealpayment());
					
					xssfcell = xssfrow.createCell(3);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.05));
					
					xssfcell = xssfrow.createCell(4);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.058));
					
					xssfcell = xssfrow.createCell(5);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment() - (listData.getRealpayment()*0.05) - (listData.getRealpayment()*0.058)));
					
				}
				
			} else { // 정산일자 기준일때
				xssfcell = xssfrow.createCell(0);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("정산날짜");
				
				xssfcell = xssfrow.createCell(1);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("주문금액");
				
				xssfcell = xssfrow.createCell(2);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("실결제금액");
				
				xssfcell = xssfrow.createCell(3);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("결제수수료");
				
				xssfcell = xssfrow.createCell(4);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("이용수수료");
				
				xssfcell = xssfrow.createCell(5);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue("정산금액");
				
				list = service.getSettleDataTotalRecord(vo);
				
				for(int index = 0; index < list.size(); index++) {
					xssfrow = xssfsheet.createRow(i++);// 한 행을 만든다.
					// 엑셀 데이터를 한 행에 8개씩 넣는다.
					SellerSettleVO listData = list.get(index);
						
					xssfcell = xssfrow.createCell(0);
					xssfcell.setCellStyle(tableStyle);
					if(listData.getSettledate() != null) {
						xssfcell.setCellValue(listData.getSettledate());
					} else {
						xssfcell.setCellValue("-");
					}
					
					xssfcell = xssfrow.createCell(1);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getOrderprice());
					
					xssfcell = xssfrow.createCell(2);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getRealpayment());
					
					xssfcell = xssfrow.createCell(3);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.05));
					
					xssfcell = xssfrow.createCell(4);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.058));
					
					xssfcell = xssfrow.createCell(5);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(Math.round(listData.getRealpayment() - (listData.getRealpayment()*0.05) - (listData.getRealpayment()*0.058)));
					
				}
				
			}
			
			
			///////////////////////////버튼이 주문건별 기준일때//////////////////////////////
		}else {
			// 컬럼 넓이 설정
			xssfsheet.setColumnWidth(0, 6000);
			xssfsheet.setColumnWidth(1, 6000);
			xssfsheet.setColumnWidth(2, 6000);
			xssfsheet.setColumnWidth(3, 6000);
			xssfsheet.setColumnWidth(4, 6000);
			xssfsheet.setColumnWidth(5, 6000);
			xssfsheet.setColumnWidth(6, 6000);
			xssfsheet.setColumnWidth(7, 6000);
			
			// 0 ~ 1행 : 2개 행,  0 ~ 5열 : 6개 까지 병합한다.
			xssfsheet.addMergedRegion(new CellRangeAddress(0,1,0,7));
			xssfsheet.autoSizeColumn(100);
			
			// 타이틀 생성
			XSSFRow xssfrow = xssfsheet.createRow(i++);
			XSSFCell xssfcell = xssfrow.createCell(0);
			xssfcell.setCellStyle(style);
			xssfcell.setCellValue("BEETMALL 정산내역");
			
			xssfsheet.createRow(i++);
			xssfrow = xssfsheet.createRow(i++); // 빈행 추가
				
				//테이블 폰트 설정
				XSSFFont tableFont = xssfwb.createFont();
				tableFont.setFontHeightInPoints((short)14);
				tableFont.setFontName("나눔고딕");
				
			// 테이블 스타일 설정
			CellStyle tableStyle = xssfwb.createCellStyle();
			XSSFDataFormat format = xssfwb.createDataFormat();
			tableStyle.setDataFormat(format.getFormat("#,##0"));
			tableStyle.setAlignment(HorizontalAlignment.CENTER);
			tableStyle.setFont(tableFont);
			tableStyle.setBorderBottom(BorderStyle.THIN);
			tableStyle.setBorderLeft(BorderStyle.THIN);
			tableStyle.setBorderRight(BorderStyle.THIN);
			tableStyle.setBorderTop(BorderStyle.THIN);
			
			xssfrow = xssfsheet.createRow(i++);
			xssfcell = xssfrow.createCell(0);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("주문번호");
			
			xssfcell = xssfrow.createCell(1);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("매출일자");
			
			xssfcell = xssfrow.createCell(2);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("주문금액");
			
			xssfcell = xssfrow.createCell(3);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("실결제금액");
			
			xssfcell = xssfrow.createCell(4);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("결제수수료");
			
			xssfcell = xssfrow.createCell(5);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("이용수수료");
			
			xssfcell = xssfrow.createCell(6);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("정산금액");
			
			xssfcell = xssfrow.createCell(7);
			xssfcell.setCellStyle(tableStyle);
			xssfcell.setCellValue("정산날짜");
			
			if(selectOption.equals("매출일자")) {  // 매출일자 기준일때
				list = service.excelOrderDateData(vo);
			} else { // 정산일자 기준일때
				list = service.excelOrderSettleData(vo);
			}
			
			for(int index = 0; index < list.size(); index++) {
				xssfrow = xssfsheet.createRow(i++);// 한 행을 만든다.
				// 엑셀 데이터를 한 행에 8개씩 넣는다.
				SellerSettleVO listData = list.get(index);
					
				xssfcell = xssfrow.createCell(0);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(listData.getOrdernum());
				
				xssfcell = xssfrow.createCell(1);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(listData.getOrderdate());
				
				xssfcell = xssfrow.createCell(2);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(listData.getOrderprice());
				
				xssfcell = xssfrow.createCell(3);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(listData.getRealpayment());
				
				xssfcell = xssfrow.createCell(4);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.05));
				
				xssfcell = xssfrow.createCell(5);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(Math.round(listData.getRealpayment()*0.058));
				
				xssfcell = xssfrow.createCell(6);
				xssfcell.setCellStyle(tableStyle);
				xssfcell.setCellValue(Math.round(listData.getRealpayment() - (listData.getRealpayment()*0.05) - (listData.getRealpayment()*0.058)));
				
				if(listData.getSettlecheck().equals("Y")) {
					xssfcell = xssfrow.createCell(7);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue(listData.getSettledate());
				} else {
					xssfcell = xssfrow.createCell(7);
					xssfcell.setCellStyle(tableStyle);
					xssfcell.setCellValue("-");
				}	
			}
		}
		

		
		System.out.println("파일 다운로드 위치 ===>"+System.getProperty("user.home")+"/Downloads/BEETMALL 정산관리.xlsx");
		File file = new File(System.getProperty("user.home")+"/Downloads/BEETMALL 정산관리.xlsx");
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
