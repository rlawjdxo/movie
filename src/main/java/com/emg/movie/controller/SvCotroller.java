package com.emg.movie.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SvCotroller {

	private ModelAndView mav;
	
	//eService: 고객센터 페이지
		@RequestMapping(value = "/eService", method = RequestMethod.GET)
		public String eService(Locale locale, Model model) {

			return "Service/eService";
		}
}
