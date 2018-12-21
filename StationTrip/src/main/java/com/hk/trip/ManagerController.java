package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.hk.trip.dto.LoginDto;
import com.hk.trip.model.IManagerService;
import com.hk.trip.model.ManagerService;



@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name. 
	 */
	@Autowired
	private IManagerService managerService;
	
	@RequestMapping(value = "/glist.do", method = RequestMethod.GET)
	public String sgetAllList(Locale locale, Model model) {
		logger.info("글목록조회", locale);
		List<LoginDto> list = managerService.sgetAllList();
		model.addAttribute("list", list);
		return "glist";//페이지의 이름만 적어준다.-->나머지는 viewResolver가 찾아줌
	}


	

	@RequestMapping(value="/managerdetail.do" , method=RequestMethod.GET)
	public String sdetailBoard(HttpServletRequest request, Locale locale,Model model,LoginDto dto) {
		logger.info("글상세조회 {}.", locale);
		LoginDto fdto= managerService.sgetBoard(dto);
		model.addAttribute("fdto", fdto);
		return "managerdetail";
	}
	@RequestMapping(value="/managerupdate.do" , method=RequestMethod.GET)
	public String supdateForm(Locale locale,Model model,LoginDto dto) {
		logger.info("글수정폼이동 {}.", locale);
		LoginDto fdto=managerService.sgetBoard(dto);
		model.addAttribute("fdto", fdto);
		return "managerupdate";
	}

	@RequestMapping(value="/supdateBoard.do" , method=RequestMethod.POST)
	public String supdateBoard(Locale locale,Model model,LoginDto fdto) {
		logger.info("글수정하기 {}.", locale);
		boolean isS=managerService.supdateBoard(fdto);
		if(isS) {
			return "redirect:managerdetail.do?user_nickname=" + fdto.getUser_nickname();
		}else {
			model.addAttribute("msg", "수정하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value="/sdelBoard.do" , method=RequestMethod.GET)
	public String sdelBoard(HttpServletRequest request, Locale locale,Model model,LoginDto dto) {
		logger.info("회원삭제하기 {}.", locale);
		boolean fdto=managerService.sdelBoard(dto);
		if(fdto) {
			return "redirect:glist.do";
		}else {
			model.addAttribute("msg", "회원 삭제실패");
			return "error";
		}
	}
	
		
	
	@RequestMapping(value="/smuldel.do" , method=RequestMethod.POST)
	public String smulDel(Locale locale,Model model,String[] chk) {
		logger.info("글여러개삭제하기 {}.", locale);
		boolean fdto=managerService.smulDelBoard(chk);
		if(fdto) {
			return "redirect:boardlist.do";
		}else {
			model.addAttribute("msg", "글여러개삭제하기실패");
			return "error";
		}
	}

	
} //끝
