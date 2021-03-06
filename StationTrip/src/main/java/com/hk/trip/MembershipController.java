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
import com.hk.trip.model.IAboardService;
import com.hk.trip.model.IFboardService;
import com.hk.trip.model.IInquiryService;
import com.hk.trip.model.IMembershipService;

@Controller
public class MembershipController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IMembershipService mService;
	
	@Autowired
	IFboardService ifboard;
	
	@Autowired
	IAboardService iAboard;
	
	@Autowired
	IInquiryService iInquiry;

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
		LoginDto dto = mService.myInfo(map);
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
		String ori_Nickname = request.getParameter("ori_Nickname");
		Map<String, String>map = new HashMap<String, String>();
		map.put("user_nickname", nickname);
		map.put("ori_nickname", ori_Nickname);
		LoginDto dto = new LoginDto(nickname,user_email,null);
		boolean isS = mService.nickChange(dto);
		if(isS) {
			ifboard.updateNickname(map);
			iAboard.AupdateNickname(map);
			iAboard.CupdateNickname(map);
			iInquiry.inquiry_nickname(map);
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
		String user_email = request.getParameter("p_email");
		LoginDto dto = new LoginDto(null,user_email,phone);
		boolean isS = mService.phoneChange(dto);
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
		LoginDto dto = mService.myInfo(map);
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
		String user_email = request.getParameter("user_email");
		Map<String, String>map  = new HashMap<String, String>();
		map.put("now_password", nowpw);
		map.put("new_password", newpw);
		map.put("user_email", user_email);
		boolean isS = mService.pwChange(map);
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
		String user_password = request.getParameter("user_password");
		boolean isS = mService.withdrawal(new LoginDto(user_email,user_password));
		if(isS) {
			pw.print("true");
		} else {
			pw.print("false");
		}
	}
}
