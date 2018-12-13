package com.hk.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
		logger.info("보드리스트 출력", locale);

		List<FboardDto> list = fboardService.getAllList();
		model.addAttribute("list", list);

		return "fboardlist";
	}

	@RequestMapping(value = "insertform.do", method = RequestMethod.GET)
	public String fboardInsertForm(Locale locale, Model model) {
		logger.info("글쓰기폼 이동", locale);

		return "fboardinsert";
	}

	@RequestMapping(value = "fboardinsert.do", method = RequestMethod.POST)
	public String fboardInsert(Locale locale, Model model, FboardDto fdto) {
		logger.info("글쓰기 실행", locale);
		boolean isS = fboardService.insertBoard(fdto);
		if (isS) {
			return "redirect:fboardlist.do";
		} else {
			model.addAttribute("msg","글 삭제하기 실패");
			return "home";
		}

	}

	@RequestMapping(value = "fboarddetail.do", method = RequestMethod.GET)
	public String fboarddetail(HttpServletRequest request,HttpServletResponse response, Locale locale, Model model, int freeboard_num) {
		logger.info("글 상세보기 이동", locale);
//		HttpSession session = request.getSession();
//		session.setAttribute("session1", session);
		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		List<CommentDto> list = fboardService.getReply(freeboard_num);

		model.addAttribute("fdto", fdto);
		model.addAttribute("list", list);
		System.out.println(model);
		return "fboarddetail";

	}
	@RequestMapping(value = "fboardupdate.do", method = RequestMethod.GET)
	public String fboardupdate(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("글 수정하기 폼 이동", locale);
		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		model.addAttribute("fdto",fdto);
		return "fboardupdate";

	}
	
	@RequestMapping(value = "fboardup.do", method = RequestMethod.POST)
	public String fboardup(HttpServletRequest request, Locale locale, Model model, FboardDto fdto) {
		logger.info("글 수정하기", locale);
		boolean isS = fboardService.upDateBoard(fdto);
		if(isS) {
			return "redirect:fboarddetail.do?freeboard_num="+fdto.getFreeboard_num();
		} else {
			model.addAttribute("msg","글 삭제하기 실패");
			return "error";
		}
	}
	@RequestMapping(value = "fboarddelete.do", method = RequestMethod.GET)
	public String fboarddelete(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("글 삭제하기", locale);
		boolean isS = fboardService.deleteBoard(freeboard_num);
		if(isS) {
			return "redirect:fboardlist.do";
		} else {
			model.addAttribute("msg","글 삭제하기 실패");
			return "error";
		}

	}
	@RequestMapping(value = "writereply.do", method = RequestMethod.POST)
	public String fboardwritereply(HttpServletRequest request, Locale locale, Model model, CommentDto cdto) {
		logger.info("댓글 작성하기", locale);
		
		boolean isS = fboardService.replyInsert(cdto);
		if(isS) {
			return "redirect:fboarddetail.do?freeboard_num="+cdto.getFreeboard_num();
		} else {
			model.addAttribute("msg","글 삭제하기 실패");
			return "error";
		}

	}
	
} //끝
