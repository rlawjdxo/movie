package com.emg.movie.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dao.emDAO;
import com.emg.movie.dto.SEARCH;
import com.emg.movie.dto.cmtMDTO;
import com.emg.movie.dto.ePAGING;
import com.emg.movie.dto.emDTO;
import com.emg.movie.dto.kDTO;



@Service
public class emService {
	
	@Autowired
	private emDAO emdao;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpServletRequest request;
	
	

	public ModelAndView Movie(emDTO emdto) {
		System.out.println("[2] controller → service : " + emdto);
		mav = new ModelAndView();

		// 파일(사진) 업로드
		// (1)경로(폴더) 생성
		String path = request.getServletContext().getRealPath("");
		// String savePath =
		// "D:\\강의자료\\SpringWorkspace\\MEMBOARD\\src\\main\\webapp\\resources\\profile\\";

		// D:\강의자료\SpringWorkspace\MEMBOARD\src\main\webapp\resources\profile\
		// D:\강의자료\SpringWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MEMBOARD\

		// .metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ 지우고
		// src\main\webapp\resources\profile\ 더하고

		String savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "")
				+ "src\\main\\webapp\\resources\\movie\\";
		MultipartFile mainFile = emdto.getMMainFile();
		MultipartFile stillcut1 = emdto.getMStillcut1();
		MultipartFile stillcut2 = emdto.getMStillcut2();
		MultipartFile stillcut3 = emdto.getMStillcut3();
		MultipartFile stillcut4 = emdto.getMStillcut4();
		
		
		
		String mPicture = null;
		String msPicture1 = null;
		String msPicture2 = null;
		String msPicture3 = null;
		String msPicture4 = null;
		
		if (!mainFile.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String mainName = mainFile.getOriginalFilename();
			mPicture = uuid + "_" + mainName;
			emdto.setMPicture(mPicture);
		}
		if (!stillcut1.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutname1 = stillcut1.getOriginalFilename();
			msPicture1 = uuid + "_" + stillcutname1;
			emdto.setMsPicture1(msPicture1);
		}
		if (!stillcut2.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName2 = stillcut2.getOriginalFilename();
			msPicture2 = uuid + "_" + stillcutName2;
			emdto.setMsPicture2(msPicture2);
		}
		if (!stillcut3.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName3 = stillcut3.getOriginalFilename();
			msPicture3 = uuid + "_" + stillcutName3;
			emdto.setMsPicture3(msPicture3);
		}
		if (!stillcut4.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName4 = stillcut4.getOriginalFilename();
			msPicture4 = uuid + "_" + stillcutName4 ;
			emdto.setMsPicture4(msPicture4);
		}



		try {
			emdao.Movie(emdto);
			System.out.println("[4] dao → service"+ mav);

			// (3) 업로드
			try {
				mainFile.transferTo(new File(savePath + mPicture));
				stillcut1.transferTo(new File(savePath + msPicture1));
				stillcut2.transferTo(new File(savePath + msPicture2));
				stillcut3.transferTo(new File(savePath + msPicture3));
				stillcut4.transferTo(new File(savePath + msPicture4));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			mav.setViewName("index");

		} catch (Exception e) {
			mav.setViewName("Movie/movie");

			// 오류가 난 부분을 알려준다.
			e.printStackTrace();
		}
		return mav;
	}

	public ModelAndView movielist(int page) {
		System.out.println("[2]Controller → service ");
		mav = new ModelAndView();
		int block = 5;
		int limit = 5;
		int mCount = emdao.mCount();
		int maxPage = (int)(Math.ceil((double)mCount/limit));
		
		if(page > maxPage) {
			page = maxPage;
		}
		
		int startRow = (page -1) * limit + 1;
		
		int endRow = page * limit;
		
		int startPage = (((int)(Math.ceil((double)page / block)))-1)*block +1;
		
		int endPage = startPage + block - 1;
	
		if(endPage > maxPage) {
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
		
		List<emDTO> movielist = emdao.movielist(paging);
		
		mav.addObject("paging",paging);
		mav.addObject("movielist",movielist);
		
		System.out.println("[4]dao → service :" + mav);
		mav.setViewName("Movie/movielist");
		
		return mav;
	}

	public ModelAndView mView(int mCode) {
		mav = new ModelAndView();

		emDTO dto = emdao.mView(mCode);

		mav.addObject("view", dto);
		mav.setViewName("Movie/movieview");
		return mav;
	}

	public ModelAndView mModifyForm(int mCode) {
		mav = new ModelAndView();
		emDTO em = emdao.mView(mCode);
		mav.addObject("modify",em);
		mav.setViewName("Movie/movieModefy");
		return mav;
	}

	public ModelAndView mDelete(emDTO mCode) {
	mav = new ModelAndView();
		
		int result = emdao.delete(mCode);
		
		if (result > 0) {
			mav.setViewName("redirect:/movielist");
			if(fileDelete(mCode.getMPicture())) {
				System.out.println("파일 삭제 성공!");
			} else {
				System.out.println("파일 삭제 실패!");
			}
		} else {
			mav.setViewName("redirect:/movieview");
		}
		return mav;
	}

	public ModelAndView mModify(emDTO emdto) {
		System.out.println("[2] controller → service : " + emdto);
		mav = new ModelAndView();

		// 파일(사진) 업로드
		// (1)경로(폴더) 생성
		String path = request.getServletContext().getRealPath("");
		String savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "")
				+ "src\\main\\webapp\\resources\\movie\\";
		

		
		MultipartFile mainFile = emdto.getMMainFile();
		MultipartFile stillcut1 = emdto.getMStillcut1();
		MultipartFile stillcut2 = emdto.getMStillcut2();
		MultipartFile stillcut3 = emdto.getMStillcut3();
		MultipartFile stillcut4 = emdto.getMStillcut4();
		
		String mPicture = null;
		String msPicture1 = null;
		String msPicture2 = null;
		String msPicture3 = null;
		String msPicture4 = null;
		
		String deleteFileName = emdto.getMPicture();
		String deleteFileName1 = emdto.getMsPicture1();
		String deleteFileName2 = emdto.getMsPicture2();
		String deleteFileName3 = emdto.getMsPicture3();
		String deleteFileName4 = emdto.getMsPicture4();
		String deleteFileNames = deleteFileName+deleteFileName1+deleteFileName2+deleteFileName3+deleteFileName4;
		if (fileDelete(deleteFileNames)) {
			System.out.println("파일 삭제 성공!");
		} else {
			System.out.println("파일 삭제 실패!");
		}
		
		if (!mainFile.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String mainName = mainFile.getOriginalFilename();
			mPicture = uuid + "_" + mainName;
			emdto.setMPicture(mPicture);
		}
		if (!stillcut1.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutname1 = stillcut1.getOriginalFilename();
			msPicture1 = uuid + "_" + stillcutname1;
			emdto.setMsPicture1(msPicture1);
		}
		if (!stillcut2.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName2 = stillcut2.getOriginalFilename();
			msPicture2 = uuid + "_" + stillcutName2;
			emdto.setMsPicture2(msPicture2);
		}
		if (!stillcut3.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName3 = stillcut3.getOriginalFilename();
			msPicture3 = uuid + "_" + stillcutName3;
			emdto.setMsPicture3(msPicture3);
		}
		if (!stillcut4.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String stillcutName4 = stillcut4.getOriginalFilename();
			msPicture4 = uuid + "_" + stillcutName4 ;
			emdto.setMsPicture4(msPicture4);
		}



		

		try {
			emdao.mModify(emdto);
			System.out.println("[4] dao → service"+ mav);

			// (3) 업로드
			try {
				mainFile.transferTo(new File(savePath + mPicture));
				stillcut1.transferTo(new File(savePath + msPicture1));
				stillcut2.transferTo(new File(savePath + msPicture2));
				stillcut3.transferTo(new File(savePath + msPicture3));
				stillcut4.transferTo(new File(savePath + msPicture4));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			mav.setViewName("redirect:/mView?mCode=" + emdto.getMCode());

		} catch (Exception e) {
			mav.setViewName("redirect:/mModifyForm?mCode=" + emdto.getMCode());

			// 오류가 난 부분을 알려준다.
			e.printStackTrace();
		}
		return mav;
	}

	private boolean fileDelete(String deleteFileNames) {
		boolean result = false;
		String path = request.getServletContext().getRealPath("");
		String savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "")
				+ "src\\main\\webapp\\resources\\movie\\";
		
		File deleteFile = new File(savePath + deleteFileNames);
		
		
		// 파일 존재여부 확인
		if (deleteFile.exists()) {
			System.out.println("파일존재o");
			// 파일 존재시 삭제
			if (deleteFile.delete()) {
				result = true;
			}
		} else {
			System.out.println("파일존재x");
		}
		
		return result;
	}


	public ModelAndView movieSearch(SEARCH search) {
		mav = new ModelAndView();
		List<emDTO>movielist = emdao.movieSearch(search);
		mav.addObject("movielist",movielist);
		mav.setViewName("Movie/movielist");
		return mav;
	}
	public List<cmtMDTO> cWrite(cmtMDTO comment) {
		emdao.cWrite(comment);
		
		List<cmtMDTO> list = emdao.cList(comment.getMCode());
		return list;
	}

	public List<cmtMDTO> cModify(cmtMDTO comment) {
		emdao.cModify(comment);
		List<cmtMDTO> list = emdao.cList(comment.getMCode());	
		return list;
	}

	public List<cmtMDTO> cDelete(cmtMDTO comment) {
		emdao.cDelete(comment);
		List<cmtMDTO> list = emdao.cList(comment.getMCode());
		return list;
	}

	public List<cmtMDTO> cList(int mCode) {
		List<cmtMDTO> list = emdao.cList(mCode);
		return list;
	}

	public ModelAndView mList() {
		mav = new ModelAndView();
		System.out.println("[2]controller → service");

		
		List<emDTO> moList = emdao.mList();



		System.out.println("[4]dao → service memList : " + moList);
	
		mav.addObject("moList", moList);
	
		mav.setViewName("Ticket/buy");

	
		return mav;
	}






	



}
