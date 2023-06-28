package com.emg.movie.dto;



import lombok.Data;

@Data
public class kDTO {
	
	
	
	// 상영정보
	private int emsCode;
	private int mCode;
	private int emgCode; // 상영관!
	private String emsDate;
	private String emsTime;
	
	private String emgName;
	private String mName;
	
 	
}
