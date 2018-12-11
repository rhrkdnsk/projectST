package com.hk.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.trip.dto.FboardDto;
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
	
	@RequestMapping(value = "fboardlist.do", method = RequestMethod.GET)
	public String getBoard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<FboardDto> list = fboardService.getAllList();
		model.addAttribute("list",list);
		
		return "fboardlist";
	}
	
	@RequestMapping(value = "fboardinsert.do", method = RequestMethod.GET)
	public String fboardInsert(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		return "fboardinsert";
	}
	
}
