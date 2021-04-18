package com.beetmall.sshj.xfarm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FarmController {
	@RequestMapping(value = "/farmEdit", method = RequestMethod.POST)
	public ModelAndView farmEdit() {
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
}
