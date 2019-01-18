package com.hk.trip;

import java.io.IOException;
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

import com.hk.trip.dto.ScheduleDto;
import com.hk.trip.model.IScheduleService;

@Controller
public class ScheduleController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IScheduleService sc_service;
	
	@RequestMapping(value = "itinerary.do", method = RequestMethod.GET)
	public String itinerary(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("itinerary.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("login_user") == null || session.getAttribute("login_user") == "") {
			model.addAttribute("msg", "역장수 회원만 이용가능한 페이지입니다");
			return "error";
		}
		String nickname = (String) session.getAttribute("login_userId");
		System.out.println("nickname = "+nickname);
		ScheduleDto dto = sc_service.scCheck(new ScheduleDto(nickname));
		System.out.println("dto = "+dto);
		if(dto == null) {
			model.addAttribute("s_msg", "등록된 일정이 없습니다");
		} else {
			model.addAttribute("dto", dto);
		}
		
		return "itinerary";
	}
	
	@RequestMapping(value = "schedulemake.do", method = RequestMethod.GET)
	public String schedulemake(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("schedulemake.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int day_info = Integer.parseInt(request.getParameter("day_info"));
		String sch_name = request.getParameter("sch_name");
		String start_date = request.getParameter("sch_date");
		int plus_date = Integer.parseInt(start_date)+day_info;
		String end_date = Integer.toString(plus_date);
		System.out.println("day_info = "+day_info);
		System.out.println("start_date = "+start_date);
		System.out.println("end_date = "+end_date);

		model.addAttribute("day_info", day_info);
		model.addAttribute("sch_name", sch_name);
		model.addAttribute("start_date", start_date);	
		model.addAttribute("end_date", end_date);	
		
		return "schedulemake";
	}
}
