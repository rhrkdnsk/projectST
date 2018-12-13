package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.dto.LoginDto;
import com.hk.trip.model.ILoginService;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ILoginService loginService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public void login(Locale locale, Model model, HttpServletRequest request,HttpServletResponse response) throws IOException {
		logger.info("login {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		System.out.println("email = " + email);
		String password = request.getParameter("password");
		System.out.println("password = " + password);
		HttpSession session = request.getSession();
		LoginDto dto = new LoginDto(email,password);
		if(loginService.login(dto) != null) {
			session.setAttribute("login_user", loginService.login(dto));
		}
		
		System.out.println("session = "+session.getAttribute("login_user"));
		if(session.getAttribute("login_user") != null) {
			out.println("good");
		} else {
			out.println("bad");
		}
		
	}
	
}