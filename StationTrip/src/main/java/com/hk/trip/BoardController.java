package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.hk.trip.dto.AboardDto;
import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;
import com.hk.trip.model.AboardService;
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
	@Autowired
	private AboardService aboardService;
	
//	@RequestMapping(value = "fboardlist.do")
//	public String getBoard(HttpServletRequest request, Locale locale, Model model, String keyWord, String keyField) {
//		logger.info("보드리스트 출력", locale);
//
//		int totalCount = fboardService.getCount(keyWord,keyField);
//
//		List<FboardDto> list = fboardService.getAllList(keyWord, keyField);
//		model.addAttribute("cdto", totalCount);
//		model.addAttribute("list", list);
//		request.getSession().removeAttribute("readcount");
//		return "fboardlist";
//
//	}

	@RequestMapping(value = "insertform.do", method = RequestMethod.GET)
	public String fboardInsertForm(HttpServletRequest request, Locale locale, Model model) {
		logger.info("글쓰기폼 이동", locale);
		// HttpSession session = request.getSession();
		// System.out.println(session);
		// session.getAttribute("login_user");

		return "fboardinsert";
	}

	@RequestMapping(value = "fboardinsert.do", method = RequestMethod.POST)
	public String fboardInsert(Locale locale, Model model, FboardDto fdto) {
		logger.info("글쓰기 실행", locale);

		boolean isS = fboardService.insertBoard(fdto);
		System.out.println(isS);
		if (isS) {
			return "redirect:fsessiondel.do";
		} else {
			model.addAttribute("msg", "글 삭제하기 실패");
			return "error";
		}

	}

	@RequestMapping(value = "fboarddetail.do", method = RequestMethod.GET)
	public String fboarddetail(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model,
			int freeboard_num) throws IOException {
		logger.info("글 상세보기 이동1112", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// HttpSession session = request.getSession();
		// session.setAttribute("session1", session);
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		CheckLikeDto dto = new CheckLikeDto();
		dto.setBoard_num(freeboard_num);
		String asd = (String) request.getSession().getAttribute("login_userId");
		dto.setUser_nickname(asd);
		
		System.out.println(asd);
		boolean isLiked = fboardService.checkLike(dto);
		//DB에 값이 없으면 Null 오류 나옴
		model.addAttribute("isLiked", isLiked);
		System.out.println("DB에 좋아요 값이 있을까 : " + isLiked);
		String rnum = (String) request.getSession().getAttribute("readcount");
		if (rnum == null) {
			fboardService.readCount(freeboard_num);
		}

		if (session.getAttribute("login_userId") == null) {

			// out.println("<script>alert('회원전용');</script>");
			// out.flush();
			model.addAttribute("msg", "회원 전용");
			return "fboardlist.do";

		}

		request.getSession().setAttribute("readcount", "조회하였음");
		FboardDto bdto = fboardService.goBack(freeboard_num);
		FboardDto ndto = fboardService.goNext(freeboard_num);
		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		List<CommentDto> list = fboardService.getReply(freeboard_num);
		model.addAttribute("fdto", fdto);
		model.addAttribute("list", list);
		model.addAttribute("bdto", bdto);
		model.addAttribute("ndto", ndto);

		return "fboarddetail";

	}

	@RequestMapping(value = "fboardupdate.do", method = RequestMethod.GET)
	public String fboardupdate(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("글 수정하기 폼 이동", locale);
		FboardDto fdto = fboardService.getDetailView(freeboard_num);
		model.addAttribute("fdto", fdto);
		return "fboardupdate";

	}

	@RequestMapping(value = "fboardup.do", method = RequestMethod.POST)
	public String fboardup(HttpServletRequest request, Locale locale, Model model, FboardDto fdto) {
		logger.info("글 수정하기", locale);
		boolean isS = fboardService.upDateBoard(fdto);
		if (isS) {
			return "redirect:fboarddetail.do?freeboard_num=" + fdto.getFreeboard_num();
		} else {
			model.addAttribute("msg", "글 삭제하기 실패");
			return "error";
		}
	}

	@RequestMapping(value = "fboarddelete.do", method = RequestMethod.GET)
	public String fboarddelete(HttpServletRequest request, Locale locale, Model model, int freeboard_num) {
		logger.info("글 삭제하기", locale);
		boolean isS = fboardService.deleteBoard(freeboard_num);
		int setNum = (Integer) request.getSession().getAttribute("nowPage");
		
		
		if (isS) {
			fboardService.bcDelete(freeboard_num);
			System.out.println("글삭제시 댓글도 같이 삭제 됩니다.");
			fboardService.deleteLike(freeboard_num);
			return "redirect:fboardPage.do?pageNum="+setNum;
		} else {
			model.addAttribute("msg", "글 삭제하기 실패");
			return "error";
		}

	}

	@RequestMapping(value = "writereply.do", method = RequestMethod.POST)
	public String fboardwritereply(HttpServletRequest request, Locale locale, Model model, CommentDto cdto) {
		logger.info("댓글 작성하기", locale);

		boolean isS = fboardService.replyInsert(cdto);
		int freeboard_num = cdto.getFreeboard_num();
		
		
		if (isS) {
			fboardService.upComment(freeboard_num);
			return "redirect:fboarddetail.do?freeboard_num=" + cdto.getFreeboard_num();
		} else {
			model.addAttribute("msg", "글 삭제하기 실패");
			return "error";
		}

	}

	@RequestMapping(value = "fboardPage.do")
	public String fboardPage(HttpServletRequest request, Locale locale, Model model, int pageNum, String keyWord,
			String keyField) {
		request.getSession().removeAttribute("readcount");
//		request.getSession().removeAttribute("skeyField");
//		request.getSession().removeAttribute("skeyWord"); 이게 있으면 페이징 처리 X


		
		
		if(request.getParameter("pageNum") == null || request.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		
		logger.info("자유게시판 페이징 처리", locale);
		HttpSession session = request.getSession();	
		System.out.println("세션 키필드 : " +  (String)session.getAttribute("skeyField"));
		System.out.println("세션 키워드 : " + (String)session.getAttribute("skeyWord"));

		//System.out.println("settingnum 값 : " + request.getParameter("settingnum"));
		
		String settingnum = request.getParameter("settingnum");
		int countList = 2;

		if(settingnum != null && settingnum != "") {
			int sum = Integer.parseInt(settingnum);
			session.setAttribute("setnum", sum);
			
			countList = sum;
			}
		
		//System.out.println("session setnum의 값  " + request.getSession().getAttribute("setnum"));

		if(request.getSession().getAttribute("setnum") != null) {
			int setNum = (Integer) request.getSession().getAttribute("setnum");
			countList = setNum;
		}		 	
		
		//여기서 수정해보기 
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "") {
			
			request.getSession().removeAttribute("skeyField");
			request.getSession().removeAttribute("skeyWord");
		}
		
		
		String skeyField = (String) session.getAttribute("skeyField");
		String skeyWord = (String) session.getAttribute("skeyWord");
			
		if(skeyField != null && skeyWord != null && skeyField != "" && skeyWord != "" ) {
		keyField = skeyField;
		keyWord = skeyWord;
		}
		
		//System.out.println("skeyField 값 : " + skeyField + "skeyWord값 : " + skeyWord );
		//+ "skeyWord값 : " + skeyWord	
		//String settingnum = request.getParameter("settingnum");
		//		if(settingnum != null && settingnum != "") {
		//			int sum = Integer.parseInt(settingnum);
		//			if(sum != 10) {
		//				countList = sum;
		//			}
		//			
		//		}
		
		int startNum = (pageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
		int endNum = pageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
		startNum++;
		endNum++;
//		System.out.println("KeyField 값 : Controller " + keyField + "keyWord의 값 : "+ keyWord   );
		int totalCount = fboardService.getCount(keyWord,keyField,startNum,endNum); //이걸 두개로 만들어서 검색어별, 그냥별로 만들어본다
		// int countList = settingnum;// 매개변수 int settingnum 지정하고 여기에 = settingnum; 써준다
		int countPage = 5;	 //하단에 출력해줄 페이지의 개수
		int totalPage = totalCount / countList; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
		if (totalCount % countList > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
		if (totalPage < pageNum) {pageNum = totalPage;}	// 
		int startPage = ((pageNum - 1) / countPage) * countPage + 1; // 여기서 countPage는 페이지 하단에 페이지 개수 설정할 숫자 ex) 1 2 3 4 5
		int endPage = startPage + countPage - 1; 	//start,endPage를 설정해줘야 
		if (endPage > totalPage) {endPage = totalPage;}
		if(pageNum == 0) {pageNum++;}
		
		//System.out.println("startPage :" + startPage + " endPage : " + endPage);
		//System.out.println("로우 넘버: " + startNum + "endNum : " + endNum);
		//System.out.println("Controller에서 totalPage의 값 : " + totalPage);
		List<FboardDto> list = fboardService.getBoardList(startNum, endNum, keyWord, keyField);
		
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "" ) {
			 session.setAttribute("skeyField", keyField);
			 session.setAttribute("skeyWord", keyWord);
			 }
		session.setAttribute("nowPage", pageNum);
		//System.out.println("totalPage의 값 : " + totalPage);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", pageNum);
//		model.addAttribute("keyWord", keyWord);
//		model.addAttribute("keyField", keyField);
		return "fboardlist";
	}
	@RequestMapping(value = "fsessiondel.do")
	public String fboardsessiondel(HttpServletRequest request, Locale locale, Model model) {
		//logger.info("자유게시판 페이징 처리", locale);
		request.getSession().removeAttribute("skeyWord");
		request.getSession().removeAttribute("skeyField");
		request.getSession().removeAttribute("setnum");

		
		return "redirect:fboardPage.do?pageNum=1";

	
	}
	
	@RequestMapping(value = "fdelcomment.do")
	public String fboarddelcomment(HttpServletRequest request, Locale locale, Model model,CommentDto cdto) {
		logger.info("자유게시판 페이징 처리", locale);
		
		boolean isS = fboardService.delComment(cdto);
		int freeboard_num = cdto.getFreeboard_num();
		
		if(isS) {
			fboardService.downComment(freeboard_num);

			return "redirect:fboarddetail.do?freeboard_num="+cdto.getFreeboard_num();

		} else {
			return "error";
		}
			
	}
		@RequestMapping(value = "fboardrepre.do")
		public String fboardcomment2(HttpServletRequest request, Locale locale, Model model,CommentDto dto) {
			logger.info("자유게시판 페이징 처리", locale);
			boolean isS = fboardService.Commentreply(dto);
			int freeboard_num = dto.getFreeboard_num();
			if(isS) {
				fboardService.upComment(freeboard_num);

				return "redirect:fboarddetail.do?freeboard_num="+dto.getFreeboard_num();
			} else {
				System.out.println("커밋오류처리");
				return "error";
			}
	
	}
		
		@RequestMapping(value = "fboardLike.do")
		public void fboardLike(HttpServletRequest request,HttpServletResponse response, Locale locale, Model model,CheckLikeDto dto) throws IOException {
			logger.info("좋아요 기능 구현", locale);
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			int like_count = 0;
			int freeboard_num = dto.getBoard_num();
			boolean isS = fboardService.checkLike(dto);
			HashMap status = new HashMap();
			
			if(isS) {
				fboardService.deleteCheck(dto);
				fboardService.downLike(freeboard_num);
				status.put("status", 404);
			} else {
				fboardService.insertCheck(dto);
				fboardService.upLike(freeboard_num);
				status.put("status", 200);
			}
	like_count = fboardService.likeCount(freeboard_num);
		
			status.put("like_count", like_count);
			String json = new Gson().toJson(status);
			 response.getWriter().write(json);


			System.out.println("Ajax 컨트롤러 요청 : " + json);
			
	}
		
		@RequestMapping(value = "fboarddelsession.do")
		public void fboardsessiondel2(HttpServletRequest request, Locale locale, Model model) {
			//logger.info("새로 검색시 검색값 없애기", locale);
			
			
			System.out.println("fboardsessiondel2 호출");
			request.getSession().removeAttribute("skeyWord");
			request.getSession().removeAttribute("skeyField");
			
		
			System.out.println("fboardsessiondel2 에서 세션 삭제 ");
		}
		
		
		@RequestMapping(value = "aboardPage.do")
		public String aboardList(HttpServletRequest request, Locale locale, Model model,int apageNum,
				String akeyField,String akeyWord,int areaboard_code) {
			logger.info("지역게시판", locale);
			request.getSession().removeAttribute("areadcount");
//			request.getSession().removeAttribute("skeyField");
//			request.getSession().removeAttribute("skeyWord"); 이게 있으면 페이징 처리 X
			System.out.println("apageNum : " + apageNum + "areaboard_code : " + areaboard_code);

			
			
			if(request.getParameter("apageNum") == null || request.getParameter("apageNum") == "") {
				apageNum = 1;
			}
			
			HttpSession session = request.getSession();	
//			System.out.println("세션 키필드 : " +  (String)session.getAttribute("skeyField"));
//			System.out.println("세션 키워드 : " + (String)session.getAttribute("skeyWord"));

			//System.out.println("settingnum 값 : " + request.getParameter("settingnum"));
			if(areaboard_code == 0 ) {
				areaboard_code = 1;
			}
			session.setAttribute("sareaboard_code", areaboard_code);
			
			String settingnum = request.getParameter("settingnum");
			int countList = 2;

			if(settingnum != null && settingnum != "") {
				int sum = Integer.parseInt(settingnum);
				session.setAttribute("asetnum", sum);
				
				countList = sum;
				}
			
			//System.out.println("session setnum의 값  " + request.getSession().getAttribute("setnum"));

			if(request.getSession().getAttribute("asetnum") != null) {
				int setNum = (Integer) request.getSession().getAttribute("asetnum");
				countList = setNum;
			}		 	
			
			//여기서 수정해보기 
			if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "") {
				
				request.getSession().removeAttribute("askeyField");
				request.getSession().removeAttribute("askeyWord");
			}
			
			
			String askeyField = (String) session.getAttribute("askeyField");
			String askeyWord = (String) session.getAttribute("askeyWord");
				
			if(askeyField != null && askeyWord != null && askeyField != "" && askeyWord != "" ) {
			akeyField = askeyField;
			akeyWord = askeyWord;
			}
			
			//System.out.println("skeyField 값 : " + skeyField + "skeyWord값 : " + skeyWord );
			//+ "skeyWord값 : " + skeyWord	
			//String settingnum = request.getParameter("settingnum");
			//		if(settingnum != null && settingnum != "") {
			//			int sum = Integer.parseInt(settingnum);
			//			if(sum != 10) {
			//				countList = sum;
			//			}
			//			
			//		}
			
			int startNum = (apageNum - 1) * countList; //Sql문 돌릴곳에서 Row 값을 설정해준다
			int endNum = apageNum * countList - 1; //Sql문 돌릴곳에서 Row값을 설정해준다 (startNum = ~(번호)에서부터 endNum = ~번호까지)
			startNum++;
			endNum++;
//			System.out.println("KeyField 값 : Controller " + keyField + "keyWord의 값 : "+ keyWord   );
			int totalCount = aboardService.getCount(akeyWord,akeyField,startNum,endNum,areaboard_code); //이걸 if로 나누어 두개로 만들어서 검색어별, 그냥별로 만들어본다
			// int countList = settingnum;// 매개변수 int settingnum 지정하고 여기에 = settingnum; 써준다
			int countPage = 5;	 //하단에 출력해줄 페이지의 개수
			int totalPage = totalCount / countList; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
			if (totalCount % countList > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
			if (totalPage < apageNum) {apageNum = totalPage;}	// 
			int startPage = ((apageNum - 1) / countPage) * countPage + 1; // 여기서 countPage는 페이지 하단에 페이지 개수 설정할 숫자 ex) 1 2 3 4 5
			int endPage = startPage + countPage - 1; 	//start,endPage를 설정해줘야 
			if (endPage > totalPage) {endPage = totalPage;}
			if(apageNum == 0) {apageNum++;}
			
			//System.out.println("startPage :" + startPage + " endPage : " + endPage);
			//System.out.println("로우 넘버: " + startNum + "endNum : " + endNum);
			//System.out.println("Controller에서 totalPage의 값 : " + totalPage);
			List<AboardDto> list = aboardService.getBoardList(startNum, endNum, akeyWord, akeyField,areaboard_code);
			
			if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "" ) {
				 session.setAttribute("askeyField", akeyField);
				 session.setAttribute("askeyWord", akeyWord);
				 }
			session.setAttribute("anowPage", apageNum);
			//System.out.println("totalPage의 값 : " + totalPage);
			model.addAttribute("list", list);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("page", apageNum);
//			model.addAttribute("keyWord", keyWord);
//			model.addAttribute("keyField", keyField);
	
			return "aboardlist";
		}
		@RequestMapping(value = "aboardinsertform.do")
		public String aboardinsertform(HttpServletRequest request, Locale locale, Model model) {
			logger.info("글쓰기 폼 이동", locale);		
			return "aboardinsert";
			
		}
		
		@RequestMapping(value = "aboardinsert.do")
		public String aboardinsert(HttpServletRequest request, Locale locale, Model model,AboardDto dto) {
			logger.info("글쓰기 폼 이동", locale);	
			
			boolean isS = aboardService.insertBoard(dto);
			
			if(isS) {
				return "redirect:aboardPage.do?apageNum=1&areaboard_code=1";
			} else {
				return "error";
			}
			
			}
		@RequestMapping(value = "aboarddetail.do", method = RequestMethod.GET)
		public String aboarddetailview(HttpServletRequest request, Locale locale, Model model, int areaboard_num,int areaboard_code) {
			logger.info("글 수정하기 폼 이동", locale);
			
			String rnum = (String) request.getSession().getAttribute("areadcount");
			if (rnum == null) {
				aboardService.readCount(areaboard_num);
			}
			
			
			request.getSession().setAttribute("areadcount", "조회하였음");

			CheckLikeDto dto1 = new CheckLikeDto();
			dto1.setBoard_num(areaboard_num);
			String asd = (String) request.getSession().getAttribute("login_userId");
			dto1.setUser_nickname(asd);
			
			System.out.println(asd);
			boolean isLiked = aboardService.checkLike(dto1);
			//DB에 값이 없으면 Null 오류 나옴
			model.addAttribute("isLiked", isLiked);
			
			AboardDto adto = aboardService.getDetailview(areaboard_num, areaboard_code);
			List<CommentDto> dto = aboardService.getReply(areaboard_num);
			AboardDto bdto = aboardService.goBack(areaboard_num, areaboard_code);
			AboardDto ndto = aboardService.goNext(areaboard_num, areaboard_code);
					
			
			System.out.println("adto : " + adto);
			model.addAttribute("fdto", adto);
			model.addAttribute("list", dto);
			model.addAttribute("bdto", bdto);
			model.addAttribute("ndto",ndto);
			return "aboarddetail";
			}
		
		@RequestMapping(value = "aboardupdate.do", method = RequestMethod.GET)
		public String aboardupdateform(HttpServletRequest request, Locale locale, Model model, int areaboard_num,int areaboard_code) {
			logger.info("글 수정하기 폼 이동", locale);
			AboardDto adto = aboardService.getDetailview(areaboard_num, areaboard_code);
			model.addAttribute("fdto", adto);
					
			
			return "aboardupdate";
			}
		@RequestMapping(value = "aboardup.do")
		public String aboardupdate(HttpServletRequest request, Locale locale, Model model, AboardDto dto) {
			logger.info("글 수정하기 폼 이동", locale);
			
			int areaboard_num = dto.getAreaboard_num();
			int areaboard_code = dto.getAreaboard_code();
			
			boolean isS = aboardService.updateBoard(dto);
			if(isS) {
				return "redirect:aboarddetail.do?areaboard_num=+areaboard_num&areaboard_code="+areaboard_code;
			} else {
				return "error";
			}
					
			
			
			}
		
		@RequestMapping(value = "aboarddelsession.do")
		public String aboardsessiondel(HttpServletRequest request, Locale locale, Model model) {
			//logger.info("새로 검색시 검색값 없애기", locale);

			
			System.out.println("aboardsessiondel 호출");
			request.getSession().removeAttribute("askeyWord");
			request.getSession().removeAttribute("askeyField");
			request.getSession().removeAttribute("asetnum");

		
			System.out.println("aboardsessiondel 에서 세션 삭제 ");
			
			return "redirect:aboardPage.do?apageNum=1&areaboard_code=1";
		}
		
		@RequestMapping(value = "aboarddel.do")
		public String aboarddel(HttpServletRequest request, Locale locale, Model model,int areaboard_num,int areaboard_code) {
			//logger.info("새로 검색시 검색값 없애기", locale);
			
			boolean isS = aboardService.deleteBoard(areaboard_num, areaboard_code);
			
			if(isS) {
				aboardService.bcDelete(areaboard_num);
				aboardService.delLike(areaboard_num);
				return "redirect:aboardPage.do?apageNum=1&areaboard_code=1";

			} else {
				return "error";
			}
						
		}
		@RequestMapping(value = "awritereply.do")
		public String aboardrep(HttpServletRequest request, Locale locale, Model model,CommentDto dto,int areaboard_code) {
			//logger.info("새로 검색시 검색값 없애기", locale);
			
			boolean isS = aboardService.insReply(dto);
			int areaboard_num = dto.getAreaboard_num();
			
			if(isS) {
				aboardService.upComment(areaboard_num);
				return "redirect:aboarddetail.do?areaboard_num="+areaboard_num+"&areaboard_code="+areaboard_code;
			} else {
				return "error";
			}
			}
		@RequestMapping(value = "adelreply.do")
		public String aboardrepdel(HttpServletRequest request, Locale locale, Model model,CommentDto dto,int areaboard_code) {
			//logger.info("새로 검색시 검색값 없애기", locale);
			
			boolean isS = aboardService.deleteReply(dto);
			int areaboard_num = dto.getAreaboard_num();
			
			if(isS) {
				aboardService.downComment(areaboard_num);
				return "redirect:aboarddetail.do?areaboard_num="+areaboard_num+"&areaboard_code="+areaboard_code;
			} else {
				return "error";
			}
			}
		@RequestMapping(value = "aboardLike.do")
		public void aboardLike(HttpServletRequest request,HttpServletResponse response, Locale locale, Model model,CheckLikeDto dto) throws IOException {
			logger.info("좋아요 기능 구현", locale);
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			int like_count = 0;
			int areaboard_num = dto.getBoard_num();
			boolean isS = aboardService.checkLike(dto);
			HashMap status = new HashMap();
			
			if(isS) {
				aboardService.deleteCheck(dto);
				aboardService.downLike(areaboard_num);
				status.put("status", 404);
			} else {
				aboardService.insertCheck(dto);
				aboardService.upLike(areaboard_num);
				status.put("status", 200);
			}
	like_count = aboardService.likeCount(areaboard_num);
		
			status.put("like_count", like_count);
			String json = new Gson().toJson(status);
			 response.getWriter().write(json);


			System.out.println("Ajax 컨트롤러 요청 : " + json);
			
	}
		
} // 끝
