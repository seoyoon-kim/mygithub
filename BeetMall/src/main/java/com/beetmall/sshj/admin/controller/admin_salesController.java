package com.beetmall.sshj.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.admin.service.Admin_SalesService;
import com.beetmall.sshj.admin.service.Boardervice;
import com.beetmall.sshj.admin.vo.Admin_SalesVO;

@Controller
public class admin_salesController {
	@Inject
	Boardervice adminService;
	////////////////////매출 관리////////////////////////////////
	
	@Autowired
	Admin_SalesService salesService;
	 	
	//판매내역 보기
	@RequestMapping("/salesListA")
	public ModelAndView salesListA() {
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/admin/salesListA");
		return mav;
	}  	
	//매출 분석
	@RequestMapping("/salesAnalasysA")
	public ModelAndView salesAnalasysA() {
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/admin/salesAnalasysA");
		return mav;
	} 	
	
	@RequestMapping(value = "/salesAdminChartData",method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, HashMap<String,Long>> salesAdminChartData(HttpServletRequest req, Admin_SalesVO vo) {
		
		/*
		 1. 날짜를 받는다
		 2. 언제부터 언제까지인지 확인하고
		 3. 년도일경우 1월 1일 ~ 12월 31일 기준으로 데이터를 검색하게 하고
		 4. 월별일경우 (해당)월 01일 ~ (해당)월 (마지막)일 까지 검색
		 5. 한번에 검색하지 못하기 때문에 여러번 검색해야한다. (반복문)
		 6. 날짜도 여러번 검색해야 하지만 누적수익,회사수익,판매자수익,구매추이 모든 분야에 대해 검색해야한다.
		 
		 */
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		// 누적수익 합계를 위한 변수
		long accumulateSum = 0;
					
		// 데이터를 보내기 위한 해시맵 데이터가 많을것이기 때문에 hash table보다 hashmap을 사용
		// 동기화 미보장, null 값이 올수도 있다
		HashMap<String, Long> achm = new HashMap<String, Long>();
		HashMap<String, Long> cohm = new HashMap<String, Long>();
		HashMap<String, Long> sehm = new HashMap<String, Long>();
		HashMap<String, Long> cuhm = new HashMap<String, Long>();

		
		
		if(vo.getCategoryDate().equals("년별")) {// 1) 날짜 구분
			// 2) 년도 확인
			int startYear = Integer.parseInt( vo.getCategoryCalendar_start() );
			int endYear = Integer.parseInt( vo.getCategoryCalendar_end() );
			
			// 2-1) start년도부터 end 년도까지 반복문
			for( int i = startYear; i <= endYear; i++) {
				startCal.set(i, 0, 1);
				endCal.set(i, 11, 31);
				
				// 3) ex) 2018-01-01 / 2018-12-31
				String startFormat = format.format(startCal.getTime());
				String endFormat = format.format(endCal.getTime());
				
				// 4) 누적수익, 회사수익, 판매자수익, 구매추이 여부 확인
				vo.setStartDate(startFormat);
				vo.setEndDate(endFormat);
				
				System.out.println(vo.getStartDate());
				System.out.println(vo.getEndDate());
				Admin_SalesVO getData = salesService.getCompaySellerCustomerData(vo);
				if(vo.getAccumulate() != null) {
					// 누적 수익을 위한 + 대입
					accumulateSum += getData.getCoPay();
					
					achm.put(i+"년", accumulateSum);
				} 
				
				if(vo.getCompany() != null) {
					cohm.put(i+"년", getData.getCoPay());
				} 
				
				if(vo.getSeller() != null) {
					sehm.put(i+"년", getData.getSePay());
				}
				
				if(vo.getCustomer() != null) {
					cuhm.put(i+"년", getData.getCuPay());
				}
				
			}//년도 반복문 종료
			
		}else if(vo.getCategoryDate().equals("월별")) {// 1) 날짜 구분
			// 2) 년도 확인
			String startDate[] = vo.getCategoryCalendar_start().split("-");
			String endDate[] = vo.getCategoryCalendar_end().split("-");
			
			int startYear = Integer.parseInt(startDate[0]);
			int startMonth = Integer.parseInt(startDate[1]);
			int endYear = Integer.parseInt(endDate[0]);
			int endMonth = Integer.parseInt(endDate[1]);
			
			// 2-1) start년도, 월부터 ~ end 년도, 월까지 반복문
			// 년 ex) 2018년 ~ 2021년
			for(int i = startYear; i <= endYear; i++ ) {
				// 월 ex) 01월 ~ 12월
				for(int j = startMonth; j <= endMonth; j++) {
					// 3-1) 검색 시작날짜인 1일 구하기 (1일)
					startCal.set(i, j-1, 1);
					String startFormat = format.format(startCal.getTime());
					int lastDay = startCal.getActualMaximum(Calendar.DAY_OF_MONTH);
					
					// 3-2)검색 종료날짜인 월의 마지막날짜 구하기 (29일, 30일, 31일)
					startCal.set(i, j-1, lastDay);
					String endFormat = format.format(startCal.getTime());

					// 4) 누적수익, 회사수익, 판매자수익, 구매추이 여부 확인
					vo.setStartDate(startFormat);
					vo.setEndDate(endFormat);
					
					
					Admin_SalesVO getData = salesService.getCompaySellerCustomerData(vo);
					if(vo.getAccumulate() != null) {
						// 누적 수익을 위한 + 대입
						accumulateSum += getData.getCoPay();
						
						achm.put(i+"-"+j+"월", accumulateSum);
					} 
					
					if(vo.getCompany() != null) {
						cohm.put(i+"-"+j+"월", getData.getCoPay());
					} 
					
					if(vo.getSeller() != null) {
						sehm.put(i+"-"+j+"월", getData.getSePay());
					}
					
					if(vo.getCustomer() != null) {
						cuhm.put(i+"-"+j+"월", getData.getCuPay());
					}
				}//월 반복문 종료
			}//년도 반복문 종료			
		}
		HashMap<String, HashMap<String,Long>> data = new HashMap<String, HashMap<String,Long>>();
		if(vo.getAccumulate() != null) {
			data.put("ac",achm);
		} // 누적수익
		
		if(vo.getCompany() != null) {
			data.put("co",cohm);
		} // 회사수익
		
		if(vo.getSeller() != null) {
			data.put("se",sehm);
		} // 판매자 수익
		
		if(vo.getCustomer() != null) {
			data.put("cu",cuhm);
		} // 구매추이
		
		
		return data;
	}
	
	//카테고리별 매출 분석
	@RequestMapping("/salesCateAnalasysA")
	public ModelAndView salesCateAnalasysA() {
		ModelAndView mav = new ModelAndView(); 
		
		
		
		
		mav.setViewName("/admin/salesCateAnalasysA");
		return mav;
	} 
		
	
}