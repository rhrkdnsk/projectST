package com.hk.trip;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import com.hk.trip.model.IMembershipService;

@Controller
public class MembershipController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IMembershipService mService;

	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("mypage.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("login_user") == null || session.getAttribute("login_user") == "") {
			model.addAttribute("msg", "역장수 회원만 이용가능한 페이지입니다");
			return "error";
		}
		String nickname = (String) session.getAttribute("login_userId");
		Map<String, String>map = new HashMap<String, String>();
		map.put("user_nickname", nickname);
		//System.out.println("ctrl nickname = "+map.get("user_nickname"));
		LoginDto dto = mService.myInfo(map);
		//System.out.println("dto = "+dto);
 		model.addAttribute("dto", dto);
		
		return "mypage";
	}
	
}
