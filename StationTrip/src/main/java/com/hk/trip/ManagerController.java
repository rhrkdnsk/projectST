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

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;
import com.hk.trip.dto.LoginDto;
import com.hk.trip.model.IManagerService;
import com.hk.trip.model.ManagerService;



@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Autowired
	private IManagerService managerService;
	


	

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
			return "redirect:glist.do?pageNum=1";
		}else {
			model.addAttribute("msg", "글여러개삭제하기실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "glist.do")
	public String sboardPage(HttpServletRequest request, Locale locale, Model model, int pageNum) {
		
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		
		logger.info("자유게시판 페이징 처리", locale);
		HttpSession session = request.getSession();	
		int countList = 15;
		System.out.println("session setnum의 값  " + request.getSession().getAttribute("setnum"));



		int startNum = (pageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
		int endNum = pageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
		startNum++;
		endNum++;
		int totalCount = managerService.sgetCount(); //이걸 두개로 만들어서 검색어별, 그냥별로 만들어본다
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
		List<LoginDto> list = managerService.sgetBoardList(startNum, endNum);
		
		session.setAttribute("nowPage", pageNum);
		//System.out.println("totalPage의 값 : " + totalPage);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", pageNum);
		return "glist";
	}
	@RequestMapping(value = "gsessiondel.do")
	public String sboardsessiondel(HttpServletRequest request, Locale locale, Model model) {
		logger.info("자유게시판 페이징 처리", locale);
		request.getSession().removeAttribute("setnum");

		
		return "redirect:glist.do?pageNum=1";

	
	}


	

} //끝
