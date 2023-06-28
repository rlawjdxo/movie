package com.emg.movie.dto;

import lombok.Data;

@Data
public class TheaterDTO {
	
	private int emgCode;	
	private String emgName;
	private String emAddr;
	private String emCost;
	private int emSeat;	
	private String emTraffic;		
		
	private String addr1;   	 // 우편번호
	private String addr2;		 // 주소
	private String addr3;

}
