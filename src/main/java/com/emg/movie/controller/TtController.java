package com.emg.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dto.TheaterDTO;
import com.emg.movie.service.TtService;

@Controller
public class TtController {
	@Autowired
	private TtService ttsvc;
	
	private ModelAndView mav;

	// theaterView : 영화관 보기 페이지
		@RequestMapping(value = "/theaterView", method = RequestMethod.GET)
		public ModelAndView theaterView(@RequestParam("emgCode") int emgCode) {
			mav = ttsvc.theaterView(emgCode);
			return mav;
		}
		
		
		// admin : 관리자 페이지로 이동
		@RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String admin() {		
			return "admin/admin_main";
		}
		
		
		// theater_input : 극장정보 입력 페이지로 이동
		@RequestMapping(value = "/theater_input", method = RequestMethod.GET)
		public String theater_input() {		
			return "Theater/Theater_info_input";
		}
		
		// theaterSave : 극장정보 저장
		@RequestMapping(value="/theaterSave", method = RequestMethod.POST)
		public ModelAndView theaterSave(@ModelAttribute TheaterDTO theater) {
			System.out.println("[1] jsp -> controller => theater : "+ theater);
			mav = ttsvc.theaterSave(theater);
			return mav;
		}
		
		// modiForm : 극장정보 수정 페이지 이동
		@RequestMapping(value = "/theatermodiForm", method = RequestMethod.GET)
		public ModelAndView modiForm(@RequestParam("emgCode") int emgCode) {
			mav = ttsvc.modiForm(emgCode);
			return mav;		
		}
		
		// theaterModify : 극장정보 수정 저장
		@RequestMapping(value = "/theaterModify", method = RequestMethod.POST)
		public ModelAndView theaterModify(@ModelAttribute TheaterDTO theater) {
			System.out.println("[1]"+theater);
			mav = ttsvc.theaterModify(theater);
			return mav;
		}
		
		// theaterDelete : 극장정보 삭제
		@RequestMapping(value = "/theaterDelete", method = RequestMethod.GET)
		public ModelAndView theaterDelete(@RequestParam("emgCode") int emgCode) {
			mav = ttsvc.theaterDelete(emgCode);
			return mav;
		}
		
		
		
		
		
	}


