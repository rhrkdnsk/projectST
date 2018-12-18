package com.hk.trip;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
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
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "areaboard.do", method = RequestMethod.GET)
	public String areaboard(Locale locale, Model model) {
		logger.info("지역 검색 이동.", locale);
		
		
		return "arealist";
		
	}

	@RequestMapping(value = "area.do")
	public void area(String code, Locale locale, Model model, HttpServletResponse res, HttpServletRequest req) throws Exception {
		logger.info("지역 목록 호출.", locale);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		System.out.println(code);
		
		String URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		String param = "?";
		URL += "areaCode";
		param += "serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D";
		param += "&numOfRows=25";
		param += "&pageNo=1";
		param += "&MobileOS=ETC";
		param += "&MobileApp=Test";
		param += "&areaCode=" + code;
		
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
		

	// http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D&numOfRows=10&pageSize=10&pageNo=1&startPage=1&MobileOS=ETC&MobileApp=AppTest&areaCode=1
	// http://api.visitkorea.or.kr/openapi/service/areaCode?serviceKey=WcZIXW%2FEjTD1n08i5CAZmsyW0pohd0p2MfMdI81qBIGQWLkSwe5Ijw4TRbbt%2FeIW5HBgOBf08uz074%2BfPFBDYQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&areaCode=1
	}
}
