package com.emg.movie.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class cmtMDTO {
	private int mNum;    		// 댓글번호
	private String euId;        // 회원정보에서 받아온 아이디
	private int mCode;  		// 영화코드	
	private String mcContent;  	// 댓글내용
	private Date mcDate;     	// 댓글 작성일	

}
 