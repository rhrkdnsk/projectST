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
	private AreaDto AreaDto;

	@RequestMapping(value = "areaboard.do", method = RequestMethod.GET)
	public String areaboard(Locale locale, Model model) {
		logger.info("지역 검색 이동.", locale);

		return "arealist";
	}

	@ResponseBody
	@RequestMapping(value = "area.do")
	public Map<String, String> area(String case1, Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("지역 목록 출력.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		Map<String,String>map=new HashMap<String, String>();


		String urlCase1 = null;
		String urlCase2 = null;
		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String param = "areaCode?"; //지역조회
		String param2 = "areaBasedList?";	//지역기반 컨텐츠 목록
		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
		param += "&numOfRows=100";		//row수
		param += "&MobileOS=ETC";		
		param += "&MobileApp=Test";
		urlCase1 = URL + param; // 시군구 값을 저장
		if(case1!=null) {
			param += "&areaCode=" + case1;	//지역코드가 null이면 '시코드'를 받고 아니면 '군구코드'를 받음
			urlCase2 = URL + param; // 군구 값 저장
		}
//		param += "&areaCode=1";	//지역코드가 null이면 '시코드'를 받고 아니면 '군구코드'를 받음
		urlCase2 = URL + param + "&areaCode=1"; // 군구 값 저장
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
			//			System.out.println(map.get("areaCase1"));
			//			System.out.println(map.get("areaCase2"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//		System.out.println(map.text());
		//		PrintWriter pw=res.getWriter();
		//		pw.println(areaCase1);
		return map;
	}

	//	@RequestMapping(value = "area.do")
	//	public void area(String code, Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
	//		logger.info("지역 목록 출력.", locale);
	//		res.setCharacterEncoding("UTF-8");
	//		res.setContentType("text/html; charset=UTF-8");
	//
	//		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	//		String param = "areaCode?"; 	//지역조회
	//		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
	//		param += "&numOfRows=100";		//row수
	//		param += "&MobileOS=ETC";		
	//		param += "&MobileApp=Test";
	//		if(code!=null) {
	//			param += "&areaCode=" + code;	//지역코드
	//		}
	//
	//
	//		String url = URL + param;
	//
	//		org.jsoup.nodes.Document doc = null;
	//		try {
	//			doc = Jsoup.connect(url).get();
	//		} catch (IOException e) {
	//			e.printStackTrace();
	//		}
	//		System.out.println(doc);
	//		PrintWriter pw=res.getWriter();
	//		pw.println(doc);
	//
	//	}

	@RequestMapping(value = "category.do")
	public void category(String sigunguCode, String category, String areaCode, Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("지역별 카테고리 출력.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String param = "areaBasedList?";	//컨텐츠조회
		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
		param += "&numOfRows=10";		
		param += "&MobileOS=ETC";
		param += "&MobileApp=Test";
		param += "&arrange=A";		// 조회순서 (A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬(O=제목순, P=조회순, Q=수정일순, R=생성일순)
		param += "&contentTypeId=" + category;	//카테고리 코드
		param += "&areaCode=" + areaCode;		// 시 코드
		param += "&sigunguCode=" + sigunguCode;	// 군구코드
		String url = URL + param;

		org.jsoup.nodes.Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(doc);
		PrintWriter pw=res.getWriter();
		pw.println(doc);

	}
}
