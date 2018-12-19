package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	public String getAllList(Locale locale, Model model) {
		logger.info("글목록조회", locale);
		List<LoginDto> list = managerService.getAllList();
		model.addAttribute("list", list);
		return "glist";//페이지의 이름만 적어준다.-->나머지는 viewResolver가 찾아줌
	}


	

	@RequestMapping(value="/managerdetail.do" , method=RequestMethod.GET)
	public String detailBoard(HttpServletRequest request, Locale locale,Model model,LoginDto dto) {
		logger.info("글상세조회 {}.", locale);
		LoginDto fdto= managerService.getBoard(dto);
		model.addAttribute("fdto", fdto);
		return "managerdetail";
	}
//	@RequestMapping(value = "gboardupdate.do", method = RequestMethod.GET)
//	public String fboardupdate(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
//		logger.info("글 수정하기 폼 이동", locale);
//		FboardDto fdto = managerService.getDetailView(freeboard_num);
//		model.addAttribute("fdto",fdto);
//		return "fboardupdate";
//
//	}
//	
//	@RequestMapping(value = "gboardup.do", method = RequestMethod.POST)
//	public String fboardup(HttpServletRequest request, Locale locale, Model model, FboardDto fdto) {
//		logger.info("글 수정하기", locale);
//		boolean isS = fboardService.upDateBoard(fdto);
//		if(isS) {
//			return "redirect:fboarddetail.do?freeboard_num="+fdto.getFreeboard_num();
//		} else {
//			model.addAttribute("msg","글 삭제하기 실패");
//			return "error";
//		}
//	}
	@RequestMapping(value="/delboard.do" , method=RequestMethod.GET)
	public String delBoard(Locale locale,Model model,LoginDto dto) {
		logger.info("글삭제하기 {}.", locale);
		boolean fdto=managerService.delBoard(dto);
		if(fdto) {
			return "redirect:glist.do";
		}else {
			model.addAttribute("msg", "글삭제실패");
			return "error";
		}
	}
	
		
	
//	@RequestMapping(value = "managerdetail.do", method = RequestMethod.GET)
//	public String fboarddelete(HttpServletRequest request, Locale locale, Model model, LoginDto dto) {
//		logger.info("글 삭제하기", locale);
//		boolean isS = managerService.delBoard(dto);
//		if(isS) {
//			return "redirect:glist.do";
//		} else {
//			model.addAttribute("msg","글 삭제하기 실패");
//			return "error";
//		}
//
//	}

	
} //끝
