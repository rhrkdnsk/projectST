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

import com.hk.trip.dto.FboardDto;
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
			return "redirect:myinquiry_sdel.do";
		} else {
			model.addAttribute("msg", "문의글 작성에 실패하였습니다");
			return "error";
		}
	}
	
	@RequestMapping(value = "myinquiry_sdel.do", method = RequestMethod.GET)
	public String myinquiry_sdel(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("myinquiry_sdel.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.getSession().removeAttribute("inquiry_setnum");
		return "redirect:myinquiry.do?pageNum=1";
	}
	
	@RequestMapping(value = "myinquiry.do", method = RequestMethod.GET)
	public String myinquiry(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int pageNum) throws IOException {
		
		logger.info("myinquiry.do {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum") == "") {
			pageNum = 1;
		}

		String settingnum = request.getParameter("settingnum");
		int countList = 10;

		if(settingnum != null && settingnum != "") {
			int sum = Integer.parseInt(settingnum);
			session.setAttribute("inquiry_setnum", sum);
			countList = sum;
			}
		
		if(request.getSession().getAttribute("inquiry_setnum") != null) {
			int inquiry_setNum = (Integer) request.getSession().getAttribute("inquiry_setnum");
			countList = inquiry_setNum;
		}		 	
		
		String user_nickname = (String) session.getAttribute("login_userId");
		Map<String, String>map = new HashMap<String, String>();
		map.put("user_nickname", user_nickname);
		int startNum = (pageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
		int endNum = pageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
		startNum++;
		endNum++;
		int totalCount = inqService.getCount(map);
		int countPage = 5;	 //하단에 출력해줄 페이지의 개수
		int totalPage = totalCount / countList; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
		if (totalCount % countList > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
		if (totalPage < pageNum) {pageNum = totalPage;}	
		int startPage = ((pageNum - 1) / countPage) * countPage + 1; // 여기서 countPage는 페이지 하단에 페이지 개수 설정할 숫자 ex) 1 2 3 4 5
		int endPage = startPage + countPage - 1; 	//start,endPage를 설정
		if (endPage > totalPage) {endPage = totalPage;}
		if(pageNum == 0) {pageNum++;}
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		List<InquiryDto> list = inqService.inquiry_list(map);
		
		session.setAttribute("nowPage", pageNum);
		model.addAttribute("inquiry_list", list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", pageNum);
		
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
			return "redirect:myinquiry_sdel.do";
		} else {
			model.addAttribute("msg", "문의글 수정에 실패하였습니다");
			return "error";
		}
	}
	@RequestMapping(value = "admin_inquiry_sdel.do", method = RequestMethod.GET)
	public String admin_inquiry_sdel(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("admin_inquiry_sdel.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.getSession().removeAttribute("admin_inquiry_setnum");
		return "redirect:admin_inquiry.do?pageNum=1";
	}
	
	@RequestMapping(value = "admin_inquiry.do", method = RequestMethod.GET)
	public String admin_inquiry(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int pageNum) throws IOException {
		
		logger.info("admin_inquiry.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		

		HttpSession session = request.getSession();
		String settingnum = request.getParameter("settingnum");
		int countList = 10;

		if(settingnum != null && settingnum != "") {
			int sum = Integer.parseInt(settingnum);
			session.setAttribute("admin_inquiry_setnum", sum);
			
			countList = sum;
			}
		

		if(request.getSession().getAttribute("admin_inquiry_setnum") != null) {
			int admin_inquiry_setnum = (Integer) request.getSession().getAttribute("admin_inquiry_setnum");
			countList = admin_inquiry_setnum;
		}		 	
		

		
		int startNum = (pageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
		int endNum = pageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
		startNum++;
		endNum++;
		int totalCount = inqService.admin_getCount(); //이걸 두개로 만들어서 검색어별, 그냥별로 만들어본다
		int countPage = 5;	 //하단에 출력해줄 페이지의 개수
		int totalPage = totalCount / countList; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
		if (totalCount % countList > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
		if (totalPage < pageNum) {pageNum = totalPage;}	// 
		int startPage = ((pageNum - 1) / countPage) * countPage + 1; // 여기서 countPage는 페이지 하단에 페이지 개수 설정할 숫자 ex) 1 2 3 4 5
		int endPage = startPage + countPage - 1; 	//start,endPage를 설정해줘야 
		if (endPage > totalPage) {endPage = totalPage;}
		if(pageNum == 0) {pageNum++;}
		
		Map<String, String>map = new HashMap<String, String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		List<InquiryDto> admin_inquiry_list = inqService.admin_inquiry_list(map);
		
		session.setAttribute("nowPage", pageNum);
		model.addAttribute("admin_inquiry_list", admin_inquiry_list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", pageNum);
		
		return "admin_inquiry";

	}
	
	@RequestMapping(value = "admin_inquiry_detail.do", method = RequestMethod.GET)
	public String admin_inquiry_detail(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int inquiry_num) throws IOException {
		
		logger.info("admin_inquiry_detail.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		InquiryDto iDto = inqService.inquiry_detail(inquiry_num);
		model.addAttribute("inquiryDto", iDto);
		
		return "admin_inquiry_detail";

	}
	@RequestMapping(value = "admin_inquiry_insert.do", method = RequestMethod.GET)
	public String admin_inquiry_insert(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int inquiry_num) throws IOException {
		
		logger.info("admin_inquiry_insert.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		InquiryDto iDto = inqService.inquiry_detail(inquiry_num);
		model.addAttribute("inquiryDto", iDto);
		return "admin_inquiry_insert";
	}
	
	@RequestMapping(value = "admin_insert.do", method = RequestMethod.GET)
	public String admin_insert(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.info("admin_insert.do {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int inquiry_num = Integer.parseInt(request.getParameter("inquiry_num"));
		int inquiry_refer = Integer.parseInt(request.getParameter("inquiry_refer"));
		HttpSession session = request.getSession();
		String admin_id = (String) session.getAttribute("login_adminId");
		String user_nickname = request.getParameter("user_nickname");
		String inquiry_title = request.getParameter("inquiry_title");
		String inquiry_content = request.getParameter("inquiry_content");
		InquiryDto iDto = new InquiryDto(inquiry_num,inquiry_title,inquiry_content,inquiry_refer,admin_id,user_nickname);
		boolean isS = inqService.admin_insert(iDto);
		if(isS) {
			return "redirect:admin_inquiry_sdel.do";
		} else {
			model.addAttribute("msg", "문의글 작성에 실패하였습니다");
			return "error";
		}
	}
}
