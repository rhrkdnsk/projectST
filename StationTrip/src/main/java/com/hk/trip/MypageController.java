package com.hk.trip;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.model.ILoginService;

@Controller
public class MypageController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ILoginService loginService;

	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("mypage.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		return "mypage";
	}
}
