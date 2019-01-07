package com.hk.trip;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.hk.trip.dto.InquiryDto;
import com.hk.trip.model.IInquiryService;

@Controller
public class InquiryController {

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IInquiryService inqService;
	
	@RequestMapping(value = "inquiry.do", method = RequestMethod.GET)
	public String inquiry(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("inquiry.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		return "inquiry";
	}
	
	@RequestMapping(value = "inquiryinsert.do", method = RequestMethod.GET)
	public String inquiryinsert(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("questioninsert.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String user_nickname = request.getParameter("user_nickname");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		Map<String, String>map = new HashMap<String, String>();
		map.put("user_nickname", user_nickname);
		map.put("inquiry_title", inquiry_title);
		map.put("inquiry_content", inquiry_content);
		boolean isS = inqService.user_insert(map);
		if(isS) {
			return "redirect:myinquiry.do";
		} else {
			model.addAttribute("msg", "문의글 작성에 실패하였습니다");
			return "error";
		}
	}
	
	@RequestMapping(value = "myinquiry.do", method = RequestMethod.GET)
	public String myinquiry(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("myinquiry.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String user_nickname = (String) session.getAttribute("login_userId");
		System.out.println("user_nickname = "+user_nickname);
		Map<String, String>map = new HashMap<String, String>();
		map.put("user_nickname", user_nickname);
		List<InquiryDto> list = inqService.inquiry_list(map);
		System.out.println("list = "+list);
		model.addAttribute("inquiry_list", list);
		return "myinquiry";

	}
	@RequestMapping(value = "inquiry_detail.do", method = RequestMethod.GET)
	public String inquiry_detail(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int inquiry_num) throws IOException {
		
		logger.info("inquiry_detail.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		InquiryDto iDto = inqService.inquiry_detail(inquiry_num);
		model.addAttribute("inquiryDto", iDto);
		
		return "inquirydetail";

	}
	
	@RequestMapping(value = "inquiry_update.do", method = RequestMethod.GET)
	public String inquiry_update(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("inquiry_update.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int inquiry_num = Integer.parseInt(request.getParameter("inquiry_num"));
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		InquiryDto iDto = new InquiryDto(inquiry_num,inquiry_title,inquiry_content);
		boolean isS = inqService.inquiry_update(iDto);
		if(isS) {
			return "redirect:myinquiry.do";
		} else {
			model.addAttribute("msg", "문의글 수정에 실패하였습니다");
			return "error";
		}
	}
}
