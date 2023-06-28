package com.emg.movie.dto;

import lombok.Data;

@Data
public class ePAGING {

	private int page; 		//현페이지
	private int maxPage;	//최대
	private int startPage;	//시작
	private int endPage;	//마지막 페이지
	private int startRow; 	//시작행
	private int endRow;		// 마지막행
	private int limit;		// 한페이지에 출력
}
