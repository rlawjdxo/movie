package com.emg.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dto.kDTO;
import com.emg.movie.dto.reserveDTO;
import com.emg.movie.service.TkService;
import com.emg.movie.service.emService;

@Controller
public class TkController {

	private ModelAndView mav;
	@Autowired
	private TkService tksvc;

	@Autowired
	private emService emsvc;

	// buyForm : 예매 페이지
	@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
	public ModelAndView buyForm() {
		mav = emsvc.mList();

		return mav;
	}

	// movie time : 상영날짜시간 등록페이지 이동
	@RequestMapping(value = "/movietiem", method = RequestMethod.GET)
	public String movietiem() {
		return "Ticket/TicketTime";
	}

	// emgtime : 상영날짜 시간 등록
	@RequestMapping(value = "/emgtime", method = RequestMethod.POST)
	public ModelAndView emgtime(@ModelAttribute kDTO kdto) {
		// @ResponseBody를 추가하면 return값이 jsp가 아닌 data로 반환된다.
		System.out.println("\n==================상영정보등록========================");
		System.out.println("[1] jsp → controller  :" + kdto);
		mav = tksvc.emgtime(kdto);
		System.out.println("[5] service → controller :" + mav + "\n");
		return mav;
	}

	// timelist : 상영 목록
	@RequestMapping(value = "/moivietimelist", method = RequestMethod.GET)
	public ModelAndView timelist(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		System.out.println("\n================ 회원목록 ================");
		System.out.println("[1]jsp → controller" + mav);
		mav = tksvc.moivietimelist(page);
		System.out.println("[5] service → controller => mav : " + mav + "\n");
		return mav;
	}

	// tView : 상영상세보기
	@RequestMapping(value = "/tView", method = RequestMethod.GET)
	public ModelAndView tView(@RequestParam("emsCode") int emsCode) {
		System.out.println("[1]jsp → controller" + emsCode);
		mav = tksvc.tView(emsCode);
		System.out.println("[5]service → controller =>mav" + mav);

		return mav;
	}

	// 상영정보수정페이지 이동
	@RequestMapping(value = "/tmodifyForm", method = RequestMethod.GET)
	public ModelAndView tmodifyForm(@RequestParam("emsCode") int emsCode) {
		System.out.println(emsCode);
		mav = tksvc.tModifyForm(emsCode);

		return mav;
		// 상영정보 수정
	}

	@RequestMapping(value = "/tkModify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute kDTO kdto) {
		System.out.println("======수정=======");
		System.out.println("[1]" + kdto);
		mav = tksvc.tkModify(kdto);
		System.out.println("[5]" + mav);
		return mav;
		// 상영정보 삭제
	}

	@RequestMapping(value = "/tDelete", method = RequestMethod.GET)
	public ModelAndView tDelete(@ModelAttribute kDTO emsCode) {
		System.out.println("======삭제=======");
		System.out.println("[1]" + emsCode);
		mav = tksvc.tDelete(emsCode);
		System.out.println("[5]" + mav);

		return mav;
	}

	// timesearch : 상영시간 조회
	@RequestMapping(value = "/timesearch", method = RequestMethod.POST)
	public @ResponseBody List<kDTO> timesearch(@ModelAttribute kDTO kdto) {
		System.out.println(kdto);
		List<kDTO> tList = tksvc.timesearch(kdto);
		return tList;
	}

	// reserve : 예매하기
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public @ResponseBody String reserve(@ModelAttribute kDTO kdto, @ModelAttribute reserveDTO rsv) {
		System.out.println("1[예매] " + kdto + ", " + rsv);
		String reserveId = tksvc.reserve(kdto, rsv);
		System.out.println("5");
		return reserveId;
	}

	// relist : 예매 목록
	@RequestMapping(value = "/relist", method = RequestMethod.GET)
	public ModelAndView relist(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		System.out.println("\n================ 예매목록 ================");
		System.out.println("[1]jsp → controller" + mav);
		mav = tksvc.relist(page);
		System.out.println("[5] service → controller => mav : " + mav + "\n");
		return mav;
	}

	// reView : 예매 상세보기
	@RequestMapping(value = "/reView", method = RequestMethod.GET)
	public ModelAndView reView(@RequestParam("reserveId") String reserveId) {
		System.out.println("[1]jsp → controller" + mav);
		mav = tksvc.reView(reserveId);
		System.out.println("[5]service → controller =>mav" + mav);

		return mav;
	}

 }
