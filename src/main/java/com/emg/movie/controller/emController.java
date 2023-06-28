package com.emg.movie.controller;

import java.util.List;
import java.util.Locale;

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
import com.emg.movie.dto.cmtMDTO;
import com.emg.movie.dto.emDTO;
import com.emg.movie.service.emService;


@Controller
public class emController {

	@Autowired
	private emService emsvc;

	private ModelAndView mav;
	
	// movieForm : 영화 등록페이지로 이동
		@RequestMapping(value = "/movieForm", method = RequestMethod.GET)
		public String movieForm(Locale locale, Model model) {

			return "Movie/movie";
		}

	// Movie : 영화 등록
	@RequestMapping(value = "/Movie", method = RequestMethod.POST)
	public ModelAndView Movie(@ModelAttribute emDTO emdto) {

		System.out.println("\n==================영화 등록========================");
		System.out.println("[1] jsp → controller => movie :" + emdto);
		mav = emsvc.Movie(emdto);
		System.out.println("[5] service → controller =>mav :" + mav + "\n");
		return mav;
	}

	// movielist : 영화 목록
	@RequestMapping(value = "/movielist", method = RequestMethod.GET)
	public ModelAndView movielist(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		System.out.println("\n================ 회원목록 ================");
		System.out.println("[1]jsp → controller" + mav);
		mav = emsvc.movielist(page);
		System.out.println("[5] service → controller => mav : " + mav + "\n");
		return mav;
	}

	// mView : 영화 상세보기
	@RequestMapping(value = "/mView", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("mCode") int mCode) {
		System.out.println("[1]jsp → controller" + mav);
		mav = emsvc.mView(mCode);
		System.out.println("[5]service → controller =>mav" + mav);

		return mav;
	}

	// modiForm : 게시글 수정 페이지로 이동
	@RequestMapping(value = "/mModifyForm", method = RequestMethod.GET)
	public ModelAndView mModifyForm(@RequestParam("mCode") int mCode) {
		System.out.println("[1] jsp → controller");
		mav = emsvc.mModifyForm(mCode);

		System.out.println("[5] service → controller");

		return mav;
	}
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute emDTO emdto){

		mav = emsvc.mModify(emdto);

		return mav;
	}

	// mDelete : 삭제
	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public ModelAndView mDelete(@ModelAttribute emDTO mCode){

		mav = emsvc.mDelete(mCode);

		return mav;
	}
	//movieSearch : 영화 검색
	@RequestMapping(value="/movieSearch", method = RequestMethod.GET)
	public ModelAndView movieSearch(@ModelAttribute SEARCH search) {
		mav = emsvc.movieSearch(search);
		return mav;
	}
	// cWrite : 댓글 작성
		@RequestMapping(value = "/cWrite", method = RequestMethod.POST)
		public @ResponseBody List<cmtMDTO> cWrite(@ModelAttribute cmtMDTO comment){
			List<cmtMDTO> list = emsvc.cWrite(comment);
			return list;
		}
		
		// cModify : 댓글수정
		@RequestMapping(value="cModify", method=RequestMethod.POST)
		public @ResponseBody List<cmtMDTO> cModify(@ModelAttribute cmtMDTO comment){
			System.out.println(comment);
			List<cmtMDTO> list = emsvc.cModify(comment);
			return list;
		}
		
		// cDelete : 댓글삭제
		@RequestMapping(value="cDelete", method=RequestMethod.POST)
		public @ResponseBody List<cmtMDTO> cDelete(@ModelAttribute cmtMDTO comment){
			List<cmtMDTO> list = emsvc.cDelete(comment);
			return list;
		}
		
		// cList : 댓글목록
		@RequestMapping(value="cList", method = RequestMethod.POST)
		public @ResponseBody List<cmtMDTO> cList(@RequestParam("mCode") int mCode){
			List<cmtMDTO> list = emsvc.cList(mCode);
			return list;
		}
		/*
		 * // mList : 예매 영화 목록
		 * 
		 * @RequestMapping(value = "/mList", method = RequestMethod.GET) public
		 * ModelAndView mList() {
		 * 
		 * System.out.println("[1]jsp → controller"); mav = emsvc.mList();
		 * System.out.println("[5]service → controller =>mav" + mav); return mav; }
		 */
}



