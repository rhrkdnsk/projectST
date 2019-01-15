package com.hk.trip;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;

import java.io.BufferedInputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;


@Controller
public class TrainController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    public static String PHARM_URL;
    public final static String KEY = "U7pliHqRjUCAas%2F0uogGjmpgE3fljYMVcE8p7JOEtkcIRKCERKMtGziSQZ2zcDczOr2WADArVrqQnZzjy7CYnA%3D%3D";
    
	@RequestMapping(value = "/cityinfo.do", method = RequestMethod.GET)
	public String cityinfo(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("cityinfo {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PHARM_URL = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyCodeList";
		
        URL url = new URL(getURLParam(null));
        System.out.println(url);
   	 
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        String tag = null;
        int event_type = xpp.getEventType();
        
        ArrayList<String> citylist = new ArrayList<String>();
        
        String cityname = null;
        String citycode = null;
        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (event_type == XmlPullParser.TEXT) {
                /* 도시명만 가져옴 */
                if(tag.equals("cityname")){
                	cityname = xpp.getText();
                }
                if(tag.equals("citycode")) {
                	citycode = xpp.getText();
                }
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("item")) {
                	citylist.add(citycode + "." + cityname);
                }
            }
 
            event_type = xpp.next();
        }
//        printList(list);
        String city = citylist.toString();
        city = city.replaceAll("[\\[\\]]", "");
        city = city	.replaceAll(" ", "");
        model.addAttribute("citylist", city);
    
        return "traininfo";
	}
//	http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList
	@RequestMapping(value = "/towninfo.do", method = RequestMethod.GET)
	public void towninfo(Locale locale, Model model,String[] citycode, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("역정보 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String city = null;
		PHARM_URL ="http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList";
		for (String sCode : citycode) {
			city = sCode;
		}
        URL url = new URL(getURLParam(null) + "&cityCode="+city);
        
		System.out.println(city);
		
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        String tag = null;
        int event_type = xpp.getEventType();
        
        ArrayList<String> townlist = new ArrayList<String>();
        
        String townname = null;
        String townid = null;
        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (event_type == XmlPullParser.TEXT) {
                /* 도시명만 가져옴 */
                if(tag.equals("nodename")){
                	townname = xpp.getText();
                }
                if(tag.equals("nodeid")){
                	townid = xpp.getText();
                }
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("item")) {
                	townlist.add(townid + "." + townname);
                }
            }
 
            event_type = xpp.next();
        }
//        printList(list);
       // model.addAttribute("townlist", townlist);
        String town = townlist.toString();
        town = town.replaceAll("[\\[\\]]", "");
        town = town	.replaceAll(" ", "");
        //System.out.println(town);
        
        
        pw.print(town);
	}
	
	@RequestMapping(value = "/trainlist.do", method = RequestMethod.GET)
	public void trainlist(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,int pageNo) throws Exception {
		logger.info("기차리스트 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		if(request.getParameter("pageNo") == null || request.getParameter("pageNo") == "") {
			pageNo = 1;
		}
		PrintWriter pw = response.getWriter();
		String startcode = null;
		String endcode = null;
		String traintime = null;
		
		if((String) session.getAttribute("startcode") != null) {
			startcode = (String) session.getAttribute("startcode");
			System.out.println("세션코드 = "+startcode);
			endcode = (String) session.getAttribute("endcode");
			traintime = (String) session.getAttribute("traintime");
		} else {
			startcode = request.getParameter("startcode");
			System.out.println("파라미터코드 = "+startcode);
			endcode = request.getParameter("endcode");
			traintime = request.getParameter("traintime");
		}
		PHARM_URL ="http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo";
        URL url = new URL(getURLParam(null) + "&depPlaceId="+startcode + "&arrPlaceId="+endcode + "&depPlandTime="+traintime + "&numOfRows=10&pageNo="+pageNo);

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        String tag = null;
        int event_type = xpp.getEventType();
        
        ArrayList<String> traininfo = new ArrayList<String>();
        String traingradename = null;
        String depplandtime = null;
        String arrplandtime = null;
        String depplacename = null;
        String arrplacename = null;
        String adultcharge = null;
        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (event_type == XmlPullParser.TEXT) {
                /* 차량명  */
                if(tag.equals("traingradename")){
                	traingradename = xpp.getText();
                }
                /* 출발시간 */
                if(tag.equals("depplandtime")){
                	depplandtime = xpp.getText();
                }
                /* 도착시간 */
                if(tag.equals("arrplandtime")){
                	arrplandtime = xpp.getText();
                }
                /* 출발지 */
                if(tag.equals("depplacename")){
                	depplacename = xpp.getText();
                }
                /* 도착지 */
                if(tag.equals("arrplacename")){
                	arrplacename = xpp.getText();
                }
                /* 운임 */
                if(tag.equals("adultcharge")){
                	adultcharge = xpp.getText();
                }
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("item")) {
                	traininfo.add(traingradename + "." + depplandtime + "." + arrplandtime + "."  + depplacename+ "." + arrplacename+ "." + adultcharge+"."+pageNo);
                }
            }
 
            event_type = xpp.next();
        }
//        printList(list);
       // model.addAttribute("townlist", townlist);
        String trainlist = traininfo.toString();
        trainlist = trainlist.replaceAll("[\\[\\]]", "");
        trainlist = trainlist	.replaceAll(" ", "");
        pw.print(trainlist);
	}
	
	
	@RequestMapping(value = "/traincheck.do", method = RequestMethod.GET)
	public void traincheck(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("기차리스트 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		session.removeAttribute("totalPage1");
		session.removeAttribute("startPage1");
		session.removeAttribute("startcode");
		session.removeAttribute("endcode");
		session.removeAttribute("traintime");
		int pageNo;
		if(request.getParameter("pageNo") == null || request.getParameter("pageNo") == "") {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		PrintWriter pw = response.getWriter();
		String startcode = request.getParameter("startcode");
		String endcode = request.getParameter("endcode");
		String traintime = request.getParameter("traintime");

		session.setAttribute("startcode", startcode);
		session.setAttribute("endcode", endcode);
		session.setAttribute("traintime", traintime);
		PHARM_URL ="http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo";
        URL url = new URL(getURLParam(null) + "&depPlaceId="+startcode + "&arrPlaceId="+endcode + "&depPlandTime="+traintime + "&numOfRows=1000");

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        String tag = null;
        int event_type = xpp.getEventType();
        
        ArrayList<String> traininfo = new ArrayList<String>();
        String traingradename = null;

        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (event_type == XmlPullParser.TEXT) {
                /* 차량명  */
                if(tag.equals("traingradename")){
                	traingradename = xpp.getText();
                	traininfo.add(traingradename);
                }
            }
 
            event_type = xpp.next();
        }
		
        int size =traininfo.size();
       
//		System.out.println("KeyField 값 : Controller " + keyField + "keyWord의 값 : "+ keyWord   );
		int totalCount =   (size + 9) / 10 * 10; //이걸 두개로 만들어서 검색어별, 그냥별로 만들어본다
		// int countList = settingnum;// 매개변수 int settingnum 지정하고 여기에 = settingnum; 써준다
		int totalPage = totalCount / 10; // 총 페이지의 개수를 설정해준다 -> jsp로 전달하여 하단 페이지 개수 생성
		if (totalCount % 10 > 0) {totalPage++;}	//총 페이지의 개수가 없으면 1을 더해준다.
		if (totalPage < pageNo) {pageNo = totalPage;}	// 

		System.out.println("totalCount = "+totalCount);

		pw.print(totalPage);
	}
	
	@RequestMapping(value = "/trainmove.do", method = RequestMethod.GET)
	public String trainmove(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("trainmove {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		return "trainlist";
	}
	
    private String getURLParam(String search){
        String url = PHARM_URL+"?ServiceKey="+KEY;
        if(search != null){
        url = url+"&yadmNm"+search;
        }
        return url;
    }
	
}
