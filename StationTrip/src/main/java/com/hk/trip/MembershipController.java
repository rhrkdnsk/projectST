package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
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
	
	@RequestMapping(value = "nickchange.do", method = RequestMethod.GET)
	public String nickchange(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("nickchange.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String nickname = request.getParameter("nickput");
		String user_email = request.getParameter("n_email");
		LoginDto dto = new LoginDto(nickname,user_email,null);
		boolean isS = mService.nickChange(dto);
		System.out.println("dto = "+dto);
		System.out.println("nickname = "+dto.getUser_nickname());
		if(isS) {
			session.setAttribute("login_userId", dto.getUser_nickname());
			return "redirect:mypage.do";
		} else {
			model.addAttribute("msg", "닉네임변경 실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "phonechange.do", method = RequestMethod.GET)
	public String phonechange(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("phonechange.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String phone = request.getParameter("phoneput");
		System.out.println(phone);
		String user_email = request.getParameter("p_email");
		LoginDto dto = new LoginDto(null,user_email,phone);
		boolean isS = mService.phoneChange(dto);
		System.out.println("phone = "+dto.getUser_phone());
		if(isS) {
			return "redirect:mypage.do";
		} else {
			model.addAttribute("msg", "연락처변경 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "pwchange.do", method = RequestMethod.GET)
	public String pwchange(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("pwchange.do {}.", locale);
		
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
		
		return "pwchange";
	}
	
	@RequestMapping(value = "changepw.do", method = RequestMethod.GET)
	public void changepw(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("pwchange.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String nowpw = request.getParameter("nowpw");
		String newpw = request.getParameter("newpw");
		Map<String, String>map  = new HashMap<String, String>();
		map.put("now_password", nowpw);
		System.out.println("nowpw="+map.get("now_password"));
		map.put("new_password", newpw);
		System.out.println("newpw="+map.get("new_password"));
		boolean isS = mService.pwChange(map);
		System.out.println(isS);
		if(isS) {
			pw.print("true");
		} else {
			pw.print("false");
		}
	}
	@RequestMapping(value = "withdrawalgo.do", method = RequestMethod.GET)
	public String withdrawalgo(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("withdrawalgo.do {}.", locale);
		
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
		LoginDto dto = mService.myInfo(map);
 		model.addAttribute("dto", dto);
		
		return "withdrawal";
	}
	
	@RequestMapping(value = "withdrawal.do", method = RequestMethod.GET)
	public void withdrawal(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("withdrawal.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String user_email = request.getParameter("user_email");
		System.out.println("user_email=" + user_email);
		String user_password = request.getParameter("user_password");
		System.out.println("user_password=" + user_password);
		boolean isS = mService.withdrawal(new LoginDto(user_email,user_password));
		System.out.println(isS);
		if(isS) {
			pw.print("true");
		} else {
			pw.print("false");
		}
	}
}
