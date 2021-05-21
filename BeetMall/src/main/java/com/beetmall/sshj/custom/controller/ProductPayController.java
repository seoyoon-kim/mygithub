package com.beetmall.sshj.custom.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.ProductPayService;
import com.beetmall.sshj.custom.vo.ProductPayVO;

@Controller
public class ProductPayController {
	
	@Inject
	ProductPayService productPayService;
	
	//==========transaction==================
	// servlet-context.xml의 트랜잭션 객체를 di(의존성 객체주입)한다.
	@Autowired
	private DataSourceTransactionManager transsactionManager;
	
	@RequestMapping("/productPay")
	public ModelAndView productPay(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		
		//웹에서 가져온 값 변수에 넣어주기
		int total = Integer.parseInt(req.getParameter("total"));//총가격
		int discountprice = Integer.parseInt(req.getParameter("discountprice"));//할인가격
		int productnum = Integer.parseInt(req.getParameter("productnum")); //상품가격
		String productname = (String)req.getParameter("productname");//상품이름
		int deliveryoption = Integer.parseInt(req.getParameter("deliveryoption")); 
		int optionnum = Integer.parseInt(req.getParameter("optionnum"));
		int totalCount = Integer.parseInt(req.getParameter("totalCount"));
		if(totalCount==2) {
			totalCount=1;
		}
		
		ProductPayVO productPayVO = new ProductPayVO();

		//productPaySubVO에 세팅하기
		productPayVO.setTotal(total);
		productPayVO.setDiscountprice(discountprice);
		productPayVO.setProductnum(productnum);
		productPayVO.setUserid(userid);
		productPayVO.setProductname(productname);
		productPayVO.setDeliveryoption(deliveryoption);
		productPayVO.setOptionnum(optionnum);
		productPayVO.setOrderquantity(totalCount);
		
		
		mav.addObject("vo", productPayService.productPay(userid, productnum));
		mav.addObject("vo2", productPayVO.getTotal());
		mav.addObject("vo3", productPayVO.getDiscountprice());
		mav.addObject("vo4", productPayVO.getProductname());
		mav.addObject("vo5", productPayVO.getDeliveryoption());
		mav.addObject("vo6", productPayVO.getOptionnum());
		mav.addObject("vo7", productPayVO.getOrderquantity());
		
		mav.setViewName("custom/category/productPay");
	
		return mav;
	}
	
	@RequestMapping("/productPaySame")
	@ResponseBody
	public ProductPayVO productPaySame(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
	
		return productPayService.productPaySame(userid);
	}
	
	//트랜지션 혹시모르니 걸어주기
	@RequestMapping("/productPayBuy")
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView productPayBuy(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		//웹에서 가져온값 변수에 넣어주기
		int point = Integer.parseInt(req.getParameter("usedpoint"));//총가격
		int mypoint = Integer.parseInt(req.getParameter("mypoint"));//마이포인트
		
		point = mypoint-point; //남은포인트
		
		//=========트랜잭션 구현을 위한 객체생성
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		
		//PROPAGATION_REQUIRED : 트랜잭션이 있으면 그 상황에서 실행, 트랜잭션이 없으면 새로운 트랜잭션을 생성해서 실행
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transsactionManager.getTransaction(def);
		
		try {
			//포인트 업데이트>쓴값으로 업데이트
			productPayService.PointUpdate(point, userid);
			
			//주문번호 넣어주기
			Calendar cal = Calendar.getInstance();
			//현재 년도, 월, 일
			String date = cal.get(cal.DATE)+"";
			 
			 
			//현재 (시,분,초)
			String hour = cal.get(cal.HOUR_OF_DAY)+"";
			String min = cal.get(cal.MINUTE)+"";
			String sec = cal.get(cal.SECOND)+"";
	
			String time = date+hour+min+sec;
			long time1 = Integer.parseInt(time);
			System.out.println("time = " + time1); //주문번호
			
			int orderprice = Integer.parseInt(req.getParameter("orderprice"));
			
			//넣어주기전에 가져온값 세팅해버리기
			ProductPayVO pro = new ProductPayVO();
			pro.setOrdernum(time1);
			pro.setUserid(userid);
			pro.setUsername(req.getParameter("username"));
			pro.setUserphone(req.getParameter("userphone"));
			pro.setOrderprice(orderprice);
			pro.setReceiver(req.getParameter("receiver"));
			pro.setReceiverphone(req.getParameter("receiverphone"));
			pro.setDeliveryzipcode(Integer.parseInt(req.getParameter("deliveryzipcode")));
			pro.setDeliveryaddr(req.getParameter("deliveryaddr"));
			pro.setDeliverydetailaddr(req.getParameter("deliverydetailaddr"));
			pro.setDeliveryprice(Integer.parseInt(req.getParameter("deliveryprice")));
			pro.setDeliveryoption(Integer.parseInt(req.getParameter("deliveryoption")));
			pro.setDeliverymemo(req.getParameter("deliverymemo"));
			pro.setUsedpoint(Integer.parseInt(req.getParameter("usedpoint")));
			pro.setRealpayment(Integer.parseInt(req.getParameter("realpayment")));
			pro.setOptionnum(Integer.parseInt(req.getParameter("optionnum")));
			
			//order테이블에 넣어주기
			productPayService.insertordertbl(pro);
			
			//orderdetail에 넣어줄값 세팅하기
			pro.setProductnum(Integer.parseInt(req.getParameter("productnum")));
			pro.setOrdernum(time1);
			pro.setOrderquantity(Integer.parseInt(req.getParameter("orderquantity")));
			pro.setOrderprice(Integer.parseInt(req.getParameter("orderprice22")));
			
			//orderdetail테이블에 넣어주기
			productPayService.inserOrderDetail(pro);
			
			int orderprice2 = (int)Math.ceil(orderprice*0.1);
			orderprice = orderprice2+point;
			
			//적립금 적립시켜주기(멤버에 Update) > 사용금액에 10퍼센트 입력시켜주기
			productPayService.UpdatePoint(orderprice, userid);
			
			//적립금 테이블에 넣어주기
			pro.setProductnum(Integer.parseInt(req.getParameter("productnum")));
			pro.setOptionnum(Integer.parseInt(req.getParameter("optionnum")));
			pro.setUserid(userid);
			pro.setChangepoint(Integer.parseInt(req.getParameter("usedpoint"))); //쓴포인트
			
			//적립금 쓴거 테이블에 넣어주고
			productPayService.usedPoint(pro);
			
			
			pro.setOrderprice(orderprice2);
			//적립금 적립하는거 테이블에 넣어준다.
			productPayService.savePoint(pro);
			
			//정상구현되면 commit 실행
			transsactionManager.commit(status);
		}catch(Exception e) {
			System.out.println("트렌젝션 오류 => "+ e.getMessage());
		}
		
		mav.addObject("vo", req.getParameter("receiver"));
		mav.addObject("vo1", req.getParameter("deliveryaddr"));
		mav.addObject("vo2", req.getParameter("deliverydetailaddr"));
		mav.addObject("vo3", req.getParameter("deliverymemo"));
		
		mav.setViewName("custom/category/Payfinish");
		return mav;
	}
	
	@RequestMapping("/Payfinish")
	public String Payfinish() {
		return "custom/category/Payfinish";
	}
}
