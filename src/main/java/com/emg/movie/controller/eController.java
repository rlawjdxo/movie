package com.emg.movie.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dto.SEARCH;
import com.emg.movie.dto.euDTO;
import com.emg.movie.service.eService;
@Controller
public class eController {
	@Autowired
	private eService esvc;

	private ModelAndView mav;

	@Autowired
	private HttpSession session;

	// 프로젝트 시작페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}



//home : index로 돌아가기
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index";
	}

//joinForm : 회원가입 페이지로 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {

		return "User/join";
	}

//idCheck : 아이디 중복 체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public @ResponseBody String idCheck(@RequestParam("euId") String euId) {
		// @ResponseBody를 추가하면 return값이 jsp가 아닌 data로 반환된다.
		String result = esvc.idCheck(euId);
		return result;
	}

	// euJoin : 회원가입
	@RequestMapping(value = "/euJoin", method = RequestMethod.POST)
	public ModelAndView euJoin(@ModelAttribute euDTO eudto) {
		// @ResponseBody를 추가하면 return값이 jsp가 아닌 data로 반환된다.
		System.out.println("\n==================회원가입========================");
		System.out.println("[1] jsp → controller => member :" + eudto);
		mav = esvc.euJoin(eudto);
		System.out.println("[5] service → controller =>mav :" + mav + "\n");
		return mav;
	}

	// login : 로그인 페이지로 이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {

		return "User/login";
	}

	// euLogin :로그인
	@RequestMapping(value = "/euLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute euDTO eudto) {

		System.out.println("\n================ 로그인 ================");
		System.out.println("[1] jsp → controller : " + eudto);

		mav = esvc.euLogin(eudto);
		System.out.println("[5] service → controller => mav : " + mav + "\n");

		return mav;

	}

	// logout : 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		session.invalidate();

		return "index";
	}

	

	// euList : 회원목록이동
	@RequestMapping(value = "/euList", method = RequestMethod.GET)
	public ModelAndView euList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		System.out.println("[1] jsp > controller >> board");

		mav = esvc.euList(page);

		return mav;
	}
	
	
	
	// euView : 회원상세히 보기
	@RequestMapping(value = "/euView", method = RequestMethod.GET)
	public ModelAndView euView(@RequestParam("euId") String euId, HttpServletRequest request, HttpServletResponse response) {
		
		mav = esvc.euView(euId);
		return mav;
	}
		
	
	//modiForm : 수정페이지 이동
	@RequestMapping(value="/modiForm", method = RequestMethod.GET)
	public ModelAndView modiForm(@RequestParam("euId") String euId) {
		mav = esvc.modiForm(euId);
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute euDTO eu){
	
		System.out.println("============회원가입==============");
		System.out.println("[1] jsp >> controller >>>> eu : " + eu);
		
		
		mav = esvc.modify(eu);
		System.out.println("[5] service >> controller >>>> mav : " + mav + "\n");

		return mav;
	}
	
	@RequestMapping(value="/euDelete", method = RequestMethod.GET)
	public ModelAndView euDelete(@ModelAttribute euDTO euId) {
		System.out.println("[1] jsp >> controller >>>> eu : " + euId);
		mav = esvc.euDelete(euId);
		return mav;
	}
	//euSearch
	@RequestMapping(value="/euSearch", method = RequestMethod.GET)
	public ModelAndView euSearch(@ModelAttribute SEARCH search) {
		mav = esvc.euSearch(search);
		return mav;
	}
	

}
