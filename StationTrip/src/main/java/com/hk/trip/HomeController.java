package com.hk.trip;

import java.io.BufferedInputStream;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public static String PHARM_URL;
    public final static String KEY = "U7pliHqRjUCAas%2F0uogGjmpgE3fljYMVcE8p7JOEtkcIRKCERKMtGziSQZ2zcDczOr2WADArVrqQnZzjy7CYnA%3D%3D";
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
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
    
		
		return "home";
	}
	
	 private String getURLParam(String search){
	        String url = PHARM_URL+"?ServiceKey="+KEY;
	        if(search != null){
	        url = url+"&yadmNm"+search;
	        }
	        return url;
	    }
		
	
}
