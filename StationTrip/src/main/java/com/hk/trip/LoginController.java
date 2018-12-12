package com.hk.trip;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.model.ILoginService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ILoginService loginService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model, HttpServletRequest request) {
		logger.info("login {}.", locale);
		
		String email = request.getParameter("email");
		String password = request.getParameter("passwrod");
		
		boolean isS = loginService.login(email, password);
		if(isS) {
			
		}
		
		
		return "home";
	}
	
}