package com.hk.trip;

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

import com.hk.trip.dto.QADto;
import com.hk.trip.model.IQAService;


@Controller
public class QAController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired IQAService QAservice;
	
	@RequestMapping(value="/qdetail.do" , method=RequestMethod.GET)
	public String qdetailBoard(HttpServletRequest request, Locale locale,Model model,String faq_num) {
		logger.info("글상세조회 {}.", locale);
		int sseq=Integer.parseInt(faq_num);
		
		QADto dto= QAservice.qgetBoard(sseq);
		model.addAttribute("dto", dto);
		return "qdetail";
	}
	@RequestMapping(value="/qupdate.do" , method=RequestMethod.GET)
	public String qupdateForm(Locale locale,Model model,String faq_num) {
		logger.info("글수정폼이동 {}.", locale);
		int sseq=Integer.parseInt(faq_num);
		QADto dto=QAservice.qgetBoard(sseq);
		model.addAttribute("dto", dto);
		return "qupdate";
	}

	@RequestMapping(value="/qupdateBoard.do" , method=RequestMethod.POST)
	public String qupdateBoard(Locale locale,Model model,QADto dto) {
		logger.info("글수정하기 {}.", locale);
		boolean isS=QAservice.qupdateBoard(dto);
		if(isS) {
			return "redirect:qdetail.do?faq_num=" + dto.getFaq_num();
		}else {
			model.addAttribute("msg", "수정하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value="/qdelBoard.do" , method=RequestMethod.GET)
	public String qdelBoard(HttpServletRequest request, Locale locale,Model model,QADto dto) {
		logger.info("글삭제하기 {}.", locale);
		boolean isS=QAservice.qdelBoard(dto);
		if(isS) {
			return "redirect:qlist.do";
		}else {
			model.addAttribute("msg", "회원 삭제실패");
			return "error";
		}
	}
	
		
	
	@RequestMapping(value="/qmuldel.do" , method=RequestMethod.POST)
	public String qmulDel(Locale locale,Model model,String[] chk) {
		logger.info("글여러개삭제하기 {}.", locale);
		boolean fdto=QAservice.qmulDelBoard(chk);
		if(fdto) {
			return "redirect:qlist.do";
		}else {
			model.addAttribute("msg", "글여러개삭제하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value="/qlist.do" , method=RequestMethod.GET)
	public String qgetAllList(HttpServletRequest request, Locale locale,Model model) {
		logger.info("글목록조회 {}.", locale);
		
		//---조회수를 증가시킨 글번호를 초기화한다.(삭제)
		request.getSession().removeAttribute("readcount");
		
		List<QADto> list=QAservice.qgetAllList();
		model.addAttribute("list", list);
		return "qlist";
	}
	@RequestMapping(value="/qinsertform.do" , method=RequestMethod.GET)
	public String qinsertform(Locale locale) {
		logger.info("글추가폼이동 {}.", locale);
		return "qboardinsert";
	}
	
	@RequestMapping(value="/qinsertboard.do" , method=RequestMethod.POST)
	public String qinsertBoard(Locale locale,Model model,QADto dto) {
		logger.info("글추가하기 {}.", locale);
		boolean isS=QAservice.qinsertBoard(dto);
		if(isS) {
			return "redirect:qlist.do";
		}else {
			return "qlist";
		}
	}
	
}
