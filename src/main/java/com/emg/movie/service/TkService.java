package com.emg.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dao.TkDAO;
import com.emg.movie.dto.ePAGING;
import com.emg.movie.dto.kDTO;
import com.emg.movie.dto.reserveDTO;

@Service
public class TkService {

	@Autowired
	private TkDAO kdao;
	private ModelAndView mav;

 

	public ModelAndView emgtime(kDTO kdto) {
		System.out.println("[2] controller → service : " + kdto);
		mav = new ModelAndView();

		int result = kdao.emgtime(kdto);

		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("Ticket/TicketTime");
		}
		System.out.println("[4] dao → service : " + mav);
		return mav;
	}

	public ModelAndView moivietimelist(int page) {
		System.out.println("[2]Controller → service ");
		mav = new ModelAndView();
		int block = 5;
		int limit = 5;
		int mCount = kdao.tCount();
		int maxPage = (int) (Math.ceil((double) mCount / limit));

		if (page > maxPage) {
			page = maxPage;
		}

		int startRow = (page - 1) * limit + 1;

		int endRow = page * limit;

		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;

		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		ePAGING paging = new ePAGING();

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		List<kDTO> timelist = kdao.moivietimelist(paging);

		mav.addObject("paging", paging);
		mav.addObject("timelist", timelist);

		System.out.println("[4]dao → service :" + timelist);
		mav.setViewName("Ticket/moivietimelist");
		return mav;
	}

	public ModelAndView tView(int emsCode) {
		mav = new ModelAndView();
		System.out.println("[2]Controller → service " + emsCode);
		kDTO kdto = kdao.tView(emsCode);

		mav.addObject("tview", kdto);
		;
		mav.setViewName("Ticket/timeview");
		System.out.println("[4]dao → service :" + mav);
		return mav;
	}

	public ModelAndView tModifyForm(int emsCode) {
		System.out.println(emsCode);
		mav = new ModelAndView();
		kDTO tkdto = kdao.tView(emsCode);
		mav.addObject("modify", tkdto);
		mav.setViewName("Ticket/timeModify");
		return mav;
	}

	public ModelAndView tkModify(kDTO kdto) {

		System.out.println("[2] controller → service : " + kdto);
		mav = new ModelAndView();

		int result = kdao.tkModify(kdto);

		if (result > 0) {
			mav.setViewName("redirect:/tView?emsCode=" + kdto.getEmsCode());
		} else {
			mav.setViewName("redirect:/tmodifyForm?emsCode=" + kdto.getEmsCode());
		}
		System.out.println("[4] dao → service : " + mav);
		return mav;
	}

	public ModelAndView tDelete(kDTO emsCode) {
		System.out.println("[2] controller → service : " + emsCode);
		mav = new ModelAndView();

		int result = kdao.tDelete(emsCode);

		if (result > 0) {
			mav.setViewName("redirect:/moivietimelist");
		} else {
			mav.setViewName("redirect:/tView?emsCode=" + emsCode.getEmsCode());
		}
		System.out.println("[4] dao → service : " + mav);
		return mav;

	}

	public List<kDTO> timesearch(kDTO kdto) {
		System.out.println("[service] : "+ kdto);
		List<kDTO> tList = kdao.timesearch(kdto);
		System.out.println("[service:tList] : "+ tList);
		return tList;
	}	
	
	public List<reserveDTO> reserve(reserveDTO rsv) {		
		int emsCode = kdao.reserve(rsv);
		System.out.println("4 emsCode : "+ emsCode);
		
		rsv.setEmsCode(emsCode);
		List<reserveDTO> rsvList = kdao.reserveInsert(rsv);		
		System.out.println("101"+rsvList);
		return rsvList;
	}
	public ModelAndView relist(int page) {
		System.out.println("[2]Controller → service ");
		mav = new ModelAndView();
		int block = 5;
		int limit = 5;
		int mCount = kdao.mCount();
		int maxPage = (int) (Math.ceil((double) mCount / limit));

		if (page > maxPage) {
			page = maxPage;
		}

		int startRow = (page - 1) * limit + 1;

		int endRow = page * limit;

		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;

		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		ePAGING paging = new ePAGING();

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		List<reserveDTO> relist = kdao.relist(paging);

		mav.addObject("paging", paging);
		mav.addObject("relist", relist);

		System.out.println("[4]dao → service :" + mav);
		mav.setViewName("Ticket/Ticketlist");
		return mav;
	}

	public ModelAndView reView(int reserveId) {
		mav = new ModelAndView();
		System.out.println("[2]Controller → service " + reserveId);
		reserveDTO rsDTO = kdao.reView(reserveId);

		mav.addObject("rsview", rsDTO);
		;
		mav.setViewName("Ticket/Ticketview");
		System.out.println("[4]dao → service :" + mav);
		return mav;
	}

	public ModelAndView bDelete(reserveDTO rsv) {
		System.out.println("[2] controller → service : " + rsv);
		mav = new ModelAndView();

		int result = kdao.bDelete(rsv);

		if (result > 0) {
			mav.setViewName("redirect:/relist");
		} else {
			mav.setViewName("redirect:/reView?reserveId=" + rsv.getReserveId());
		}
		System.out.println("[4] dao → service : " + mav);
		return mav;
	}




}
