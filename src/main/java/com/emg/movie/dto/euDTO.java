package com.emg.movie.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class euDTO {
	private String euId;			// 아이디
	private String euPw;			// 비밀번호
	private String euName;		// 이름
	private String euBirth;		// 생년월일
	private String euGender;		// 성별
	private String euEmail;		// 이메일
	private String euPhone;		// 연락처
	private String euAddr;		// 주소
	
	private MultipartFile euProfile;		// 업로드 파일
	private String euProfileName;		// 업로드 파일이름
	
	private String addr1;	// 우편번호
	private String addr2;	// 주소
	private String addr3;	// 상세주소
	
	private int euPoint;	//포인트
}
