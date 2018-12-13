package com.hk.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;
import com.hk.trip.model.FboardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private FboardService fboardService;

	@RequestMapping(value = "fboardlist.do", method = RequestMethod.GET)
	public String getBoard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<FboardDto> list = fboardService.getAllList();
		model.addAttribute("list", list);

		return "fboardlist";
	}

	@RequestMapping(value = "insertform.do", method = RequestMethod.GET)
	public String fboardInsertForm(Locale locale, Model model) {
		logger.info("글쓰기폼 이동.", locale);

		return "fboardinsert";
	}

	@RequestMapping(value = "fboardinsert.do", method = RequestMethod.POST)
	public String fboardInsert(Locale locale, Model model, FboardDto fdto) {
		logger.info("Welcome home! The client locale is {}.", locale);
		boolean isS = fboardService.insertBoard(fdto);
		if (isS) {
			return "redirect:fboardlist.do";
		} else {
			return "index";

		}

	}

	@RequestMapping(value = "fboarddetail.do", method = RequestMethod.GET)
	public String fboarddetail(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("Welcome home! The client locale is {}.", locale);

		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		List<CommentDto> list = fboardService.getReply(freeboard_num);

		model.addAttribute("fdto", fdto);
		model.addAttribute("list", list);
		System.out.println(model);
		return "fboarddetail";

	}
	@RequestMapping(value = "fboardupdate.do", method = RequestMethod.GET)
	public String fboardupdate(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("Welcome home! The client locale is {}.", locale);
		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		model.addAttribute("fdto",fdto);
		return "fboardupdate";

	}
	
	@RequestMapping(value = "fboardup.do", method = RequestMethod.POST)
	public String fboardup(HttpServletRequest request, Locale locale, Model model, FboardDto fdto) {
		logger.info("Welcome home! The client locale is {}.", locale);
		boolean isS = fboardService.upDateBoard(fdto);
		if(isS) {
			return "redirect:fboarddetail.do?freenum="+fdto.getFreeboard_num();
		} else {
			return "redirect:fboarddetail.do?freenum="+fdto.getFreeboard_num();

		}
	}
}
