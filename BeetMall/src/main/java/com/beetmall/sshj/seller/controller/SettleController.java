package com.beetmall.sshj.seller.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.seller.service.SettleService;
import com.beetmall.sshj.seller.vo.SettleVO;

@Controller
public class SettleController {
	
	@Autowired
	SettleService service;
	
	@RequestMapping("/settle")
	public String settlement() {
		return "seller/settlement_management";
	}
	
	// 주문건별 매출일자 검색
	@RequestMapping(value = "/sellerSettleSearchingData",method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<Object> searchingData(HttpServletRequest req,SettleVO vo) {
		// 기본 설정
		vo.setUserid((String)req.getSession().getAttribute("logId"));

		// 페이지로 보낼 array 데이터
		ArrayList<Object> sendData = new ArrayList<Object>();
		
		// 조회기준 날짜, 주문 건별 구분
		if(!req.getParameter("selectBtnCheck").equals("날짜")) {
			System.out.println("test");
			// 주문 건별 기준일때, total구하기
			// 정산 금액 총 합계 가져오기
			List<SettleVO> totalSettle = service.totalSettle(vo); // totalMoney, totalRecord
			
			if(totalSettle.size() !=0) { // 값이 1이상 있으면 실행된다.
				SettleVO vo2 = totalSettle.get(0);
				sendData.add(0,vo2);// array[0]에 totalMoney, totalRecord 보내는 데이터
				// 계산된 값이 있으면 꺼내서 array 2번으로 보내기위해 세팅한다
				vo.setTotalRecord(totalSettle.get(0).getTotalRecord()); 
			} else {
				sendData.add(0, 0); // array[0]보내는 데이터
			}
		}

		// selectBtnCheck가 무엇이냐! 날짜냐, 주문건별이나 확인
		if(req.getParameter("selectBtnCheck").equals("날짜")) { // 날짜 기준일때, 매출일자와 정산날짜 기준인지 확인
			List<SettleVO> listData = service.getDateData(vo);
			
			// list에 들어있는 갯수를 totalRecord로 세팅한다.
			vo.setTotalRecord(listData.size()); 
			System.out.println(vo.getTotalRecord());
			
			if(req.getParameter("selectOption").equals("매출일자")){
				sendData.add(1, listData);
			} else {
				sendData.add(1, service.getSettleData(vo));
			}
			System.out.println(sendData.get(1).toString());
		} else { // 주문 건별 기준일때, 매출일자와 정산날짜 기준인지 확인
			//매출일자 기준이면 getOrderDateData 실행
			if(req.getParameter("selectOption").equals("매출일자")) {
				sendData.add(1, service.getOrderDateData(vo)); // array[1] vo 데이터를 보낸
			} else { // 정산날짜 기준이면 getOrderSettleData
				sendData.add(1, service.getOrderSettleData(vo)); //
			}
		}		
		sendData.add(2, vo);
		
		return sendData;
	}
	

}
