package com.emg.movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dao.TtDAO;
import com.emg.movie.dto.TheaterDTO;

@Service
public class TtService {
	@Autowired
	private TtDAO ttdao;
	
	private ModelAndView mav;

	public ModelAndView theaterSave(TheaterDTO theater) {
		mav = new ModelAndView();
		System.out.println("[2] controller -> service => theater : "+ theater);

		String emAddr = "(" + theater.getAddr1() + ") "
				+ theater.getAddr2() + ", "
				+ theater.getAddr3();
		
		theater.setEmAddr(emAddr);		
		System.out.println(" [a]theater : "+ theater);			
		
		int result = ttdao.theaterSave(theater);
		System.out.println("[4] dao -> service : "+ result);
		
		if(result>0) {
			mav.setViewName("admin/admin_main");
		} else
			mav.setViewName("Theater/Theater_info_input");
		
		return mav;
	}

	public ModelAndView theaterView(int emgCode) {
		mav = new ModelAndView();
		
		TheaterDTO theater = ttdao.theaterView(emgCode);
		
		mav.setViewName("Theater/TheaterView");
		mav.addObject("view", theater);
		
		return mav;		
	}

	public ModelAndView modiForm(int emgCode) {
		mav = new ModelAndView();
		 TheaterDTO theater = ttdao.theaterView(emgCode);
		 
		 mav.setViewName("Theater/TheaterModify");
		 mav.addObject("modify", theater);
		 
		return mav;
	}

	public ModelAndView theaterModify(TheaterDTO theater) {
		mav = new ModelAndView();
		
		String emAddr = "(" + theater.getAddr1() + ") "
				+ theater.getAddr2() + ", "
				+ theater.getAddr3();
		
		theater.setEmAddr(emAddr);
		
		int result = ttdao.theaterModify(theater);
		
		if(result>0) {
			mav.setViewName("redirect:/theaterView?emgCode=" + theater.getEmgCode());
		} else {
			mav.setViewName("redirect:/modiForm?emgCode=" + theater.getEmgCode());
		}
		
		return mav;
	}

	public ModelAndView theaterDelete(int emgCode) {
		mav = new ModelAndView();
		
		int result = ttdao.theaterDelete(emgCode);
		
		if(result>0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("Theater/TheaterModify");
		}
		return mav;
	}
	
}
