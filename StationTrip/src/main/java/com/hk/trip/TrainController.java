package com.hk.trip;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
	public String cityinfo(Locale locale, Model model) throws Exception {
		logger.info("cityinfo {}.", locale);
		PHARM_URL = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyCodeList";
		
        URL url = new URL(getURLParam(null));
   	 
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
    
        
        //기차 표시
        URL urld = new URL("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getVhcleKndList?serviceKey=U7pliHqRjUCAas%2F0uogGjmpgE3fljYMVcE8p7JOEtkcIRKCERKMtGziSQZ2zcDczOr2WADArVrqQnZzjy7CYnA%3D%3D");

		XmlPullParserFactory factorys = XmlPullParserFactory.newInstance();
        factorys.setNamespaceAware(true);
        XmlPullParser xpps = factorys.newPullParser();
        BufferedInputStream biss = new BufferedInputStream(urld.openStream());
        xpps.setInput(biss, "utf-8");
        
        String tags = null;
        int event_types = xpps.getEventType();
        
        ArrayList<String> traincode = new ArrayList<String>();
        
        String trainName = null;
        String trainId = null;
        while (event_types != XmlPullParser.END_DOCUMENT) {
            if (event_types == XmlPullParser.START_TAG) {
                tags = xpps.getName();
            } else if (event_types == XmlPullParser.TEXT) {
                /* 도시명만 가져옴 */
                if(tags.equals("vehiclekndnm")){
                	trainName = xpps.getText();
                }
                if(tags.equals("vehiclekndid")){
                	trainId = xpps.getText();
                }
            } else if (event_types == XmlPullParser.END_TAG) {
                tags = xpps.getName();
                if (tags.equals("item")) {
                	traincode.add(trainId + "." + trainName);
                }
            }
 
            event_types = xpps.next();
        }
        String train = traincode.toString();
        train = train.replaceAll("[\\[\\]]", "");
        train = train.replaceAll(" ", "");
       // System.out.println(train);
        model.addAttribute("traincode", train);

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
	public void trainlist(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("기차리스트 {}.", locale);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String startcode = request.getParameter("startcode");
		String endcode = request.getParameter("endcode");
		String traintime = request.getParameter("traintime");
		PHARM_URL ="http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo";
		
        URL url = new URL(getURLParam(null) + "&depPlaceId="+startcode + "&arrPlaceId="+endcode + "&depPlandTime="+traintime);

		System.out.println("startcode = "+startcode);
		System.out.println("endcode = "+endcode);
		System.out.println("traintime = "+traintime);
		
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
                	traininfo.add(traingradename + "." + depplandtime + "." + arrplandtime + "."  + depplacename+ "." + arrplacename+ "." + adultcharge);
                }
            }
 
            event_type = xpp.next();
        }
//        printList(list);
       // model.addAttribute("townlist", townlist);
        String trainlist = traininfo.toString();
        trainlist = trainlist.replaceAll("[\\[\\]]", "");
        trainlist = trainlist	.replaceAll(" ", "");
        System.out.println("trainlist= "+trainlist);
        pw.print(trainlist);
	}
	
	
    private String getURLParam(String search){
        String url = PHARM_URL+"?ServiceKey="+KEY;
        if(search != null){
        url = url+"&yadmNm"+search;
        }
        return url;
    }
	
}
