package com.hk.trip;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.hk.trip.dto.RhksflDto;
import com.hk.trip.model.IRhkflService;

@Controller
public class RhksflController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired IRhkflService rhksflservice;
	
	@RequestMapping(value="/rdetail.do" , method=RequestMethod.GET)
	public String rdetailBoard(HttpServletRequest request, Locale locale,Model model,String seq) {
		logger.info("글상세조회 {}.", locale);
		int sseq=Integer.parseInt(seq);
		
		RhksflDto dto= rhksflservice.rgetBoard(sseq);
		model.addAttribute("dto", dto);
		return "rdetail";
	}
	@RequestMapping(value="/rupdate.do" , method=RequestMethod.GET)
	public String rupdateForm(Locale locale,Model model,String seq) {
		logger.info("글수정폼이동 {}.", locale);
		int sseq=Integer.parseInt(seq);
		RhksflDto dto=rhksflservice.rgetBoard(sseq);
		model.addAttribute("dto", dto);
		return "rupdate";
	}

	
	@RequestMapping(value="/rupdateBoard.do" , method=RequestMethod.POST)
	public String rupdateBoard(Locale locale,Model model,RhksflDto dto) {
		logger.info("글수정하기 {}.", locale);
		boolean isS=rhksflservice.rupdateBoard(dto);
		if(isS) {
			return "redirect:rdetail.do?seq=" + dto.getSeq();
		}else {
			model.addAttribute("msg", "수정하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value="/rdelBoard.do" , method=RequestMethod.GET)
	public String rdelBoard(HttpServletRequest request, Locale locale,Model model,RhksflDto dto) {
		logger.info("글삭제하기 {}.", locale);
		boolean isS=rhksflservice.rdelBoard(dto);
		if(isS) {
			return "redirect:rlist.do?pageNum=1";
		}else {
			model.addAttribute("msg", "회원 삭제실패");
			return "error";
		}
	}
	
		
	
	@RequestMapping(value="/rmuldel.do" , method=RequestMethod.POST)
	public String smulDel(Locale locale,Model model,String[] chk) {
		logger.info("글여러개삭제하기 {}.", locale);
		boolean fdto=rhksflservice.rmulDelBoard(chk);
		if(fdto) {
			return "redirect:rlist.do?pageNum=1";
		}else {
			model.addAttribute("msg", "글여러개삭제하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "rlist.do")
	public String sboardPage(HttpServletRequest request, Locale locale, Model model, int pageNum) {
		
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		
		logger.info("자유게시판 페이징 처리", locale);
		HttpSession session = request.getSession();	
		int countList = 10;
		System.out.println("session setnum의 값  " + request.getSession().getAttribute("setnum"));



		int startNum = (pageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
		int endNum = pageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
		startNum++;
		endNum++;
		int totalCount = rhksflservice.rgetCount(); //이걸 두개로 만들어서 검색어별, 그냥별로 만들어본다
		int countPage = 5;	 //하단에 출력해줄 페이지의 개수
		int totalPage = totalCount / countList; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
		if (totalCount % countList > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
		if (totalPage < pageNum) {pageNum = totalPage;}	// 
		int startPage = ((pageNum - 1) / countPage) * countPage + 1; // 여기서 countPage는 페이지 하단에 페이지 개수 설정할 숫자 ex) 1 2 3 4 5
		int endPage = startPage + countPage - 1; 	//start,endPage를 설정해줘야 
		if (endPage > totalPage) {endPage = totalPage;}
		if(pageNum == 0) {pageNum++;}
		
		System.out.println("startPage :" + startPage + " endPage : " + endPage);
		System.out.println("로우 넘버: " + startNum + "endNum : " + endNum);
		System.out.println("Controller에서 totalPage의 값 : " + totalPage);
		List<RhksflDto> list = rhksflservice.rgetBoardList(startNum, endNum);
		
		session.setAttribute("nowPage", pageNum);
		//System.out.println("totalPage의 값 : " + totalPage);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", pageNum);
		return "rlist";
	}
	@RequestMapping(value = "rsessiondel.do")
	public String sboardsessiondel(HttpServletRequest request, Locale locale, Model model) {
		logger.info("자유게시판 페이징 처리", locale);
		request.getSession().removeAttribute("setnum");

		
		return "redirect:rlist.do?pageNum=1";

	
	}
	@RequestMapping(value="/rinsertform.do" , method=RequestMethod.GET)
	public String insertform(Locale locale) {
		logger.info("글추가폼이동 {}.", locale);
		return "rboardinsert";
	}
	
	@RequestMapping(value="/rinsertboard.do" , method=RequestMethod.POST)
	public String insertBoard(Locale locale,Model model,RhksflDto dto) {
		logger.info("글추가하기 {}.", locale);
		boolean isS=rhksflservice.rinsertBoard(dto);
		if(isS) {
			return "redirect:rlist.do?pageNum=1";
		}else {
//			model.addAttribute("msg", "글추가하기실패");
			return "rlist";
		}
	}
}
