package com.emg.movie.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class reserveDTO {
	
	private int reserveId;
	private String euId;
	private int emsCode;
	private int emgCode;
	private int mCode;	
	private String mName;
	private String emgName;
	private String emsDate;
	private String emsTime;
	private String emCost;
	
	private String mPicture;		// 메인포스터
	private MultipartFile mMainFile; // 메인 업로드 파일
	
	

}
