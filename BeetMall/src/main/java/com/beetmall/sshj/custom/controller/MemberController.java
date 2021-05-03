package com.beetmall.sshj.custom.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beetmall.sshj.custom.service.MemberService;
import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.MemberVO;
import com.beetmall.sshj.custom.vo.SellerMemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService memberservice;
	@Inject
	JavaMailSenderImpl mailSender;
	@Inject
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("login")	// 로그인 페이지
	public String login() {	
		return "login/login";	
	}
	@RequestMapping("register")	// 회원가입페이지
	public String register() {
		return "login/register";
	}
	@RequestMapping("cregister")
	public String cResigter() {	// 구매자 회원가입
		return "login/cRegister";
	}
	@RequestMapping("sregister")
	public String sRegister() {	// 판매자 회원가입
		return "login/sRegister";	
	}
	@RequestMapping("registerFinish")
	public String regiFin() {
		return "login/registerFinish.jsp";
	}
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("idOverLap")
	@ResponseBody
	public int idCheck(HttpServletRequest req) {
		String id = req.getParameter("Checkid");
		System.out.println("id = "+id);
		int result = memberservice.idOverlap(id);
		System.out.println("result = "+result);
		
		return result;
	}
	
	@RequestMapping(value="userinfo", method = RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String infoSelect(HttpServletRequest req) {
		String info = req.getParameter("infoname");
		System.out.println(info);
		String result = memberservice.infoSelect(info);
		return result;
	}
	
	// 로그인
	@RequestMapping(value="loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = memberservice.loginOk(userid, userpwd);
		
		if(!vo.getUserstop().equals("Y")) {
			if(vo.getUserid()!= null && !vo.getUserid().equals("")) {
				session.setAttribute("logId",vo.getUserid());
				session.setAttribute("logName", vo.getUsername());
				session.setAttribute("logStatus", "Y");
				session.setAttribute("logType", vo.getUsertype());
				mav.setViewName("redirect:/");
			}else {
				mav.setViewName("redirect:login");
			}
		}else {
			mav.addObject("logStop","Y");
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logoutOk(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	// 회원가입
	@RequestMapping(value="/cregiFinish", method=RequestMethod.POST)
	public ModelAndView regiFinishiOk(MemberVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String tel1 = req.getParameter("userphone1");
		String tel2 = req.getParameter("userphone2");
		String tel3 = req.getParameter("userphone3");
		vo.setUserphone(tel1+"-"+tel2+"-"+tel3);
		
		// 확인용 //
//		System.out.println("id-->"+vo.getUserid());	// 널
//		System.out.println("pwd-->"+vo.getUserpwd());	// 잘들어옴
//		System.out.println("name-->"+vo.getUsername());	//ㅇㅇ
//		System.out.println("tel-->"+vo.getUserphone());	//ㅇㅇ
//		System.out.println("email-->"+vo.getUseremail());	//ㅇㅇ
//		System.out.println("zipcode-->"+vo.getUserzipcode());	//ㅇㅇ
//		System.out.println("addr-->"+vo.getUseraddr());	//ㅇㅇ
//		System.out.println("userdetaildder-->"+vo.getUserdetailaddr());	//ㅇㅇ
//		System.out.println("birth-->"+vo.getBirthday());	//ㅇㅇ
//		System.out.println("joindate-->"+vo.getJoindate());	// 널
//		System.out.println("type-->"+vo.getUsertype());	//0
//		System.out.println("stop-->"+vo.getUserstop());	//널
//		System.out.println("point-->"+vo.getPoint());	//0
		// 확인용 //	
		if(memberservice.regiFinishiOk(vo)==1) {
			mav.setViewName("redirect:registerFinish");
		}else {
			mav.addObject(vo);
			mav.addObject("userphone1",tel1);
			mav.addObject("userphone2",tel2);
			mav.addObject("userphone3",tel3);
			mav.addObject("result","NO");
			mav.setViewName("redirect:cregister");
		}
		return mav;
	}
	// 판매자 회원가입
	@RequestMapping(value="/sregiFinish", method=RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView dddd(MemberVO vo, SellerMemberVO svo, CategoryFarmVO cvo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String tel1 = req.getParameter("userphone1");
		String tel2 = req.getParameter("userphone2");
		String tel3 = req.getParameter("userphone3");
		
		vo.setUserphone(tel1+"-"+tel2+"-"+tel3);
		// 판매자 테이블로 들어가야 하는 부분
		String path = req.getSession().getServletContext().getRealPath("/resources/sellerregiimgs");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("sellerregiimg");
		String uploadFilename = new String();
		if(file!=null) {	// 첨부파일이 있을 때
			String orgFilename = file.getOriginalFilename();
			if(!orgFilename.equals("") && orgFilename!=null) {
				File f = new File(path, orgFilename);
				int i = 1;
				while(f.exists()) {	// 있으면 true, 없으면 false
					int point = orgFilename.lastIndexOf(".");	// .위치
					String name = orgFilename.substring(0, point);	// 파일명
					String extName = orgFilename.substring(point+1);	//확장자
					f = new File(path, name+"_"+ i++ +"."+extName);
				}// while end
				try {
					file.transferTo(f);
				}catch (Exception e) {
					e.printStackTrace();
				}
				// 변경된 파일명
				uploadFilename = f.getName();
			}
		}// if end
		svo.setSellerregiimg(uploadFilename);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			int result1 = memberservice.regiFinishiOk(vo);
			System.out.println("농장번호"+cvo.getStorenum());
			cvo.setLatitude("0");
			cvo.setLogetitude("0");
			System.out.println("방문자수"+cvo.getFarmvisitor());
			
			int result2 = memberservice.farmInsert(cvo);
			System.out.println("농장번호"+cvo.getStorenum());
			svo.setStorenum(cvo.getStorenum());
			System.out.println("id-->"+svo.getUserid());	//ㅇㅇ
			System.out.println("num-->"+svo.getStorenum());	// 0 
			System.out.println("storename-->"+svo.getStorename()); // ㅇㅇ
			System.out.println("sellername-->"+svo.getSellername());	//ㅇㅇ
			System.out.println("sellerreginum-->"+svo.getSellerreginum());	//ㅇㅇ
			System.out.println("sellerregiimg-->"+svo.getSellerregiimg());	// 널
			System.out.println("regiapproval-->"+svo.getRegiapproval());	// 널
			System.out.println("regiapprovaldate-->"+svo.getRegiapprovaldate());	//널
			System.out.println("zipcode-->"+svo.getStorezipcode());	// ㅇㅇ
			System.out.println("addr-->"+svo.getStoreaddr());	//ㅇㅇ
			System.out.println("detailaddr-->"+svo.getStoredetailaddr());	// ㅇㅇ
			System.out.println("storeemail-->"+svo.getStoreemail());	//ㅇㅇ
			System.out.println("bank-->"+svo.getBank());	//ㅇㅇ
			System.out.println("bankname-->"+svo.getBankname());	//ㅇㅇ
			System.out.println("bankaccount-->"+svo.getBankaccount()); //ㅇㅇ
			
			int result3 = memberservice.sellerRegiFinishiOk(svo);
			// 정상실행시 commit
			transactionManager.commit(status);
			mav.setViewName("redirect:registerFinish");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("트랜잭션 문제.. 되게 골치아프니 주의..");
			mav.addObject(vo);
			mav.addObject(svo);
			mav.addObject("userphone1",tel1);
			mav.addObject("userphone2",tel2);
			mav.addObject("userphone3",tel3);
			mav.addObject("result","NO");
			mav.setViewName("redirect:sregister");
		}
		return mav;
	}
	
	
	
	//이메일 인증코드 발송
	@RequestMapping(value="emailSend", method=RequestMethod.GET, produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String sendemail(HttpSession session, HttpServletRequest req) {
		String userEmail = req.getParameter("SendToEmail");
		UUID random = UUID.randomUUID();
		String uuid = random.toString();
		String emailCode = uuid.substring(0,6);
		System.out.println("\n\n===========================\n\n");
		System.out.println("emailCode == "+emailCode);
		System.out.println("\n\n===========================\n\n");
		String subject = "[BeetMall]비트몰 구매자 이메일 인증"; // 메일 제목부분
		String content =  "비트몰 이메일 인증입니다.<br/>"
						+ "인증번호 : "+emailCode ;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("beetamll0528@gmail.com");
			messageHelper.setTo(userEmail);
			messageHelper.setSubject(subject);
			messageHelper.setText("text/html;charset=UTF-8", content);
			mailSender.send(message);
			session.setAttribute("emailCode", emailCode);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("이메일 인증 오류");
		}
		return "";
	}
	
	@RequestMapping("emailCheck")
	@ResponseBody
	public int emailCodeCheck(HttpServletRequest req, HttpSession session) {
		String inputEmailCode = req.getParameter("emailCode");
		System.out.println("inputEmailCode="+inputEmailCode);
		String emailCode = (String)session.getAttribute("emailCode");
		System.out.println("emailCode="+emailCode);
		if(inputEmailCode.equals(emailCode)) {
			return 1;
		}else {
			return -1;
		}
	}
	
	
	// 판매자 이메일 인증코드 발송
	@RequestMapping(value="emailSendSeller", method=RequestMethod.GET, produces="application/text;charset=UTF-8" )
	@ResponseBody
	public String sendemailSeller(HttpSession session, HttpServletRequest req) {
		String userEmail = req.getParameter("SendToEmail");
		UUID random = UUID.randomUUID();
		String uuid = random.toString();
		String emailCode = uuid.substring(7,13);
		System.out.println("\n\n===========================\n\n");
		System.out.println("emailCode == "+emailCode);
		System.out.println("\n\n===========================\n\n");
		String subject = "[BeetMall]비트몰 판매자 이메일 인증"; // 메일 제목부분
		String content =  "비트몰 이메일 인증입니다.<br/>" + "인증번호 : "+emailCode ;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("beetamll0528@gmail.com");
			messageHelper.setTo(userEmail);
			messageHelper.setSubject(subject);
			messageHelper.setText("text/html;charset=UTF-8", content);
			mailSender.send(message);
			session.setAttribute("emailCodeSeller", emailCode);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("이메일 인증 오류");
		}
		return "";
	}
	
	@RequestMapping("emailCheckSeller")
	@ResponseBody
	public int emailCodeCheckSeller(HttpServletRequest req, HttpSession session) {
		String inputEmailCode = req.getParameter("emailCode");
		System.out.println("inputEmailCode="+inputEmailCode);
		String emailCodeSeller = (String)session.getAttribute("emailCodeSeller");
		System.out.println("emailCode="+emailCodeSeller);
		if(inputEmailCode.equals(emailCodeSeller)) {
			return 1;
		}else {
			return -1;
		}
	}
	
	
	
	@RequestMapping("regiFinish")
	public String regiFinish() {	// 회원가입 완료
		return "login/registerFinish";	
	}
}
