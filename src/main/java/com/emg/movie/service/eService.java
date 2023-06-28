package com.emg.movie.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.emg.movie.dao.eDAO;
import com.emg.movie.dto.SEARCH;
import com.emg.movie.dto.ePAGING;
import com.emg.movie.dto.emDTO;
import com.emg.movie.dto.euDTO;

@Service
public class eService {

	@Autowired
	private eDAO edao;

	private ModelAndView mav;
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private BCryptPasswordEncoder pwEnc;

	@Autowired
	private HttpSession session;

	public ModelAndView euJoin(euDTO eudto) {
		System.out.println("[2] controller → service : " + eudto);
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
				+ "src\\main\\webapp\\resources\\profile\\";

		MultipartFile EuProfile = eudto.getEuProfile();

		String euProfileName = null;

		if (!EuProfile.isEmpty()) {
			// (2)파일 이름 생성(식별자 uuid + 파일 원래 이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);

			String fileName = EuProfile.getOriginalFilename();

			euProfileName = uuid + "_" + fileName;
			eudto.setEuProfileName(euProfileName);

		}

		// [2] 주소결합
		String euAddr = "(" + eudto.getAddr1() + ") " + eudto.getAddr2() + ", " + eudto.getAddr3();

		// (22223) 인천시 매소홀로 488번길 6-32, 태승빌딩4층

		eudto.setEuAddr(euAddr);

		// [3] 비밀번호 암호화
		eudto.setEuPw(pwEnc.encode(eudto.getEuPw()));

		try {
			edao.euJoin(eudto);
			System.out.println("[4] dao → service");

			// (3) 업로드
			try {
				EuProfile.transferTo(new File(savePath + euProfileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			mav.setViewName("index");

		} catch (Exception e) {
			mav.setViewName("User/join");

			// 오류가 난 부분을 알려준다.
			e.printStackTrace();
		}

		return mav;
	}

	public String idCheck(String euId) {
		String result = null;

		String checkId = edao.idCheck(euId);

		if (checkId == null) {
			// 아이디 사용가능
			result = "OK";

		} else {
			// 아이디 사용불가능
			result = "NO";
		}

		return result;
	}

	public ModelAndView euLogin(euDTO eudto) {
		System.out.println("[2] controller → service : " + eudto);
		mav = new ModelAndView();

		// db에서 해당 id에 대한 pw를 가져온다(암호화 된 비밀번호)
		String encPw = edao.euLogin(eudto.getEuId());

		// 로그인 페이지에서 입력한 비밀번호
		String mPw = eudto.getEuPw();

		// matches() 를 사용해서 입력한 비밀번호와 암호화 된 비밀번호 매칭하기
		if (pwEnc.matches(mPw, encPw)) {
			session.setAttribute("loginId", eudto.getEuId());
			mav.setViewName("index");
		} else {
			mav.setViewName("User/login");
		}

		return mav;
	}

	public ModelAndView euList(int page) {
		System.out.println("[2] controller >> scrvice ");
		mav = new ModelAndView();

		// 한 화면에 보여줄 페이지 번호 갯수
		int block = 5;

		// 한 화면에 보여줄 게시글 갯수
		int limit = 5;

		// 전체 게시글 갯수 : 10
		int mCount = edao.mCount();

		// 최대 페이지 : 2
		int maxPage = (int) (Math.ceil((double) mCount / limit));

		if (page > maxPage) {
			page = maxPage;
		}

		// 시작 행 : 1 6 11
		int startRow = (page - 1) * limit + 1;

		// 끝나는 행 : 5 10 15
		int endRow = page * limit;

		// 시작하는 페이지
		int startPage = (((int) (Math.ceil((double) page / block))) - 1) * block + 1;

		// 끝나는 페이지
		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		// 페이지 객체 생성
		ePAGING paging = new ePAGING();

		paging.setPage(page);
		paging.setStartPage(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		// 페이징 목록 불러오기
		List<euDTO> euList = edao.euList(paging);

		mav.addObject("paging", paging);
		mav.addObject("euList", euList);
		mav.setViewName("User/list");
		System.out.println("[4] DAO >> service");

		return mav;
	}

	public ModelAndView euView(String euId) {
		mav = new ModelAndView();

		euDTO eu = edao.euView(euId);

		mav.setViewName("User/view");
		mav.addObject("view", eu);

		return mav;
	}

	public ModelAndView modiForm(String euId) {
		mav = new ModelAndView();

		euDTO eu = edao.euView(euId);

		mav.setViewName("User/modify");
		mav.addObject("modify", eu);

		return mav;
	}

	public ModelAndView modify(euDTO eu) {
		System.out.println("[2] controller >> service >>>> eu : " + eu);
		mav = new ModelAndView();

		String path = request.getServletContext().getRealPath("");

		System.out.println(path);

		String savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "")
				+ "src\\main\\webapp\\resources\\profile\\";

		// (0) 기존에 있던 파일 지우기
		String deleteFileName = eu.getEuProfileName();

		// 기존 파일 설정 파일 삭제
		File deleteFile = new File(savePath + deleteFileName);

		// 파일 존재여부 확인
		if (deleteFile(deleteFileName)) {
			System.out.println("파일 삭제 성공!");
		} else {
			System.out.println("파일 삭제 실패!");
		}


		// 파일 정보 가져오기
		MultipartFile EuProfile = eu.getEuProfile();
		String EuProfileName = null;

		if (!EuProfile.isEmpty()) {

			// 2.파일이름생성(식별자 uuid + 파일 원래이름)
			String uuid = UUID.randomUUID().toString().substring(0, 8);

			String fileName = EuProfile.getOriginalFilename();

			EuProfileName = uuid + "_" + fileName;
			eu.setEuProfileName(EuProfileName);

		}

		// 주소 결합
		String euAddr = "(" + eu.getAddr1() + ")" + eu.getAddr2() + " ," + eu.getAddr3();
		// (2223) 인천시 매소홀로 488번길 9-9,대승3층

		eu.setEuAddr(euAddr);

		// 비번 암호화
		eu.setEuPw(pwEnc.encode(eu.getEuPw()));

		try {
			edao.modify(eu);
			System.out.println("[4] dao >> service");

			// 3. 업로드
			try {
				EuProfile.transferTo(new File(savePath + EuProfileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			mav.setViewName("redirect:/euView?euId=" + eu.getEuId());

		} catch (Exception e) {

			mav.setViewName("redirect:/modiForm?euId=" + eu.getEuId());

			// 오류난 부분 알려준다
			e.printStackTrace();

		}

		return mav;
	}

	private boolean deleteFile(String deleteFileName) {
	boolean result = false;
		
		String path = request.getServletContext().getRealPath("");
		String savePath = path.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "")
				+ "src\\main\\webapp\\resources\\profile\\";

		File deleteFile = new File(savePath + deleteFileName);
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

	public ModelAndView euDelete(euDTO euId) {
	mav = new ModelAndView();
		
		int result = edao.euDelete(euId);
		
		if (result > 0) {
			
				mav.setViewName("redirect:/euView?euId=" + euId.getEuId());
			
			
			if(deleteFile(euId.getEuProfileName())) {
				System.out.println("파일 삭제 성공!");
			} else {
				System.out.println("파일 삭제 실패!");
			}
		} else {
			mav.setViewName("redirect:/euView?euId=" + euId.getEuId());
		}
		return mav;
	}

	public ModelAndView euSearch(SEARCH search) {
		mav = new ModelAndView();
		List<euDTO> euList = edao.euSearch(search);

		
		mav.addObject("euList", euList);
		mav.setViewName("User/list");
		System.out.println("[4] DAO >> service");

		return mav;
	
	}
	

}
