package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.hk.trip.dto.AreaDto;

@Controller
public class AreaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "areaboard.do", method = RequestMethod.GET)
	public String areaboard(Locale locale, Model model) {
		logger.info("지역 검색 이동.", locale);

		return "arealist";
	}

	@ResponseBody
	@RequestMapping(value = "areaList.do")
	public Map<String, String> areaList(String case1, String case2, String case3,
			Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("지역 목록 출력.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		Map<String,String>map=new HashMap<String, String>();

		if(case1 == "") {
			case1 = "1";
		} if(case2 == "") {
			case2 = "1";
		} if(case3 == "") {
			case3 = "12";
		}

		String urlCase1 = null;
		String urlCase2 = null;
		String urlCase3 = null;
		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String serviceName = "areaCode";
		String param = "?"; 		//지역조회
		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
		param += "&MobileOS=ETC";		
		param += "&MobileApp=Test";
		param += "&numOfRows=25";
		/* 시 값을 받을 url */
		urlCase1 = URL + serviceName + param;

		/* 구,군 값을 받을 url */
		param += "&areaCode=" + case1;
		urlCase2 = URL + serviceName + param;


		System.out.println("*******************************************************");
		System.out.println(urlCase1);
		System.out.println(urlCase2);
		System.out.println("*******************************************************");
		Document areaCase1 = null;
		Document areaCase2 = null;
		try {
			areaCase1 = Jsoup.connect(urlCase1).get();
			areaCase2 = Jsoup.connect(urlCase2).get();
			map.put("areaCase1", areaCase1.toString());
			map.put("areaCase2", areaCase2.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "contentList.do")
	public Map<String, String> contentList(String case1, String case2, String case3, String pageNo, String contentId,
			Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("컨텐츠 목록 출력.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		Map<String,String>map=new HashMap<String, String>();
		
		if(case1 == "") {
			case1 = "1";
		} if(case2 == "") {
			case2 = "1";
		} if(case3 == "") {
			case3 = "12";
		} if(pageNo == "") {
			pageNo = "1";
		}
		
		String urlCase3 = null;
		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String serviceName = "areaBasedList";
		String param = "?"; 		//지역조회
		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
		param += "&MobileOS=ETC";		
		param += "&MobileApp=Test";
		param += "&numOfRows=2";
		param += "&areaCode=" + case1;
		param += "&sigunguCode=" + case2;
		param += "&contentTypeId=" + case3;
		param += "&arrange=P";
		param += "&pageNo=" + pageNo;
		param += "&startPage=1";
		param += "&totalCount";
		/* 컨텐츠 조회 */
		urlCase3 = URL + serviceName + param;
		
		System.out.println("*******************************************************");
		System.out.println(urlCase3);
		System.out.println("*******************************************************");
		Document areaContent = null;
		try {
			areaContent = Jsoup.connect(urlCase3).get();
			map.put("areaContent", areaContent.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;

	}
	
	@ResponseBody
	@RequestMapping(value = "overView.do")
	public Map<String, String> overView(String contentId,
			Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("컨텐츠 소개 출력.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		Map<String,String>map=new HashMap<String, String>();
		
		String x = contentId.toString();
		x = x.trim();
		
		String urlCase4 = null;
		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String serviceName = "detailCommon";
		String param = "?"; 		//지역조회
		param += "serviceKey=U7pliHqRjUCAas%2F0uogGjmpgE3fljYMVcE8p7JOEtkcIRKCERKMtGziSQZ2zcDczOr2WADArVrqQnZzjy7CYnA%3D%3D";
		param += "&MobileOS=ETC";		
		param += "&MobileApp=Test";
		param += "&contentId=" + x;
		param += "&overviewYN=Y";
		/* 컨텐츠 소개 조회 */
		urlCase4 = URL + serviceName + param;
		
		System.out.println("*******************************************************");
		System.out.println(urlCase4);
		System.out.println(x);
		System.out.println("*******************************************************");
		Document overView = null;
		try {
			overView = Jsoup.connect(urlCase4).get();
			map.put("overView", overView.toString());
			System.out.println("*** : "+overView.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;

	}
	
	@RequestMapping(value = "areaDetail.do", method = RequestMethod.GET)
	public String areaDetail(String con, Locale locale, Model model) {
		logger.info("관광지 상세보기 이동.", locale);
		model.addAttribute("con", con);
		
		
		return "areadetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "detailView.do")
	public Map<String, String> detailView(Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("관광지 상세보기.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		Map<String,String>map=new HashMap<String, String>();
		
		return map;
	}
}


