package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.Cookie;
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
	public void login(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("login {}.", locale);
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		// System.out.println("email = " + email);
		String password = request.getParameter("password");
		// System.out.println("password = " + password);
		HttpSession session = request.getSession();
		LoginDto dto = new LoginDto(email, password);
		if (loginService.login(dto) != null) {
			session.setAttribute("login_user", loginService.login(dto));
			System.out.println("session = "+session.getAttribute("login_user"));
			out.print(session.getAttribute("login_user"));
		}
	}

	@RequestMapping(value = "signup.do", method = RequestMethod.GET)
	public void signup(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("회원가입 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		LoginDto dto = new LoginDto(nickname, null, email, name, password, phone, 0, 0);
		System.out.println(dto);

		boolean isS = loginService.signup(dto);
		if (isS) {
			out.print("회원가입 성공");
		} else {
			out.print("");
		}

	}

	@RequestMapping(value = "createCookie.do", method = RequestMethod.GET)
	public void createCookie(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		logger.info("login {}.", locale);
		PrintWriter out = response.getWriter();
		Cookie setCookie = new Cookie("saveId", request.getParameter("email")); // 쿠키 이름을 name으로 생성
		response.addCookie(setCookie);
		
//		Cookie[] getCookie = request.getCookies();
//		if (getCookie != null) {
//
//			for (int i = 0; i < getCookie.length; i++) {
//
//				Cookie c = getCookie[i];
//
//				String name = c.getName(); // 쿠키 이름 가져오기
//
//				String value = c.getValue(); // 쿠키 값 가져오기
//
//			}
//
//		}
	}

}