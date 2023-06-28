package com.emg.movie.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class emDTO {

	private int mCode;				// 영화코드
	private String mPicture;		// 메인포스터
	private MultipartFile mMainFile; // 메인 업로드 파일
	private String mName;			// 영화이름
	private String mCategory;		// 장르
	private String mActors;			// 배우
	private String mDirector;		// 감독
	private String mRtime;			// 영화재생시간
	private String mStory;			// 줄거리
	private String mAge;			// 관람연령
	private Date mDate;				// 개봉일
	

	
	private MultipartFile mStillcut1;	//스틸컷1 업로드 파일
	private String msPicture1;		//스틸컷1 업로드 파일이름
	private MultipartFile mStillcut2;	//스틸컷1 업로드 파일
	private String msPicture2;		//스틸컷1 업로드 파일이름
	private MultipartFile mStillcut3;	//스틸컷1 업로드 파일
	private String msPicture3;		//스틸컷1 업로드 파일이름
	private MultipartFile mStillcut4;	//스틸컷1 업로드 파일
	private String msPicture4;		//스틸컷1 업로드 파일이름
	
	
}
