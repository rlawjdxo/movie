package com.emg.movie.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.emg.movie.dto.TheaterDTO;

@Repository
public class TtDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public int theaterSave(TheaterDTO theater) {
		System.out.println("[3] service -> dao => theater : "+ theater);
		return sql.insert("TT.theaterSave", theater);		
	}

	public TheaterDTO theaterView(int emgCode) {
		return sql.selectOne("TT.theaterView", emgCode);
	}

	public int theaterModify(TheaterDTO theater) {
		return sql.update("TT.theaterModify", theater);
	}

	public int theaterDelete(int emgCode) {
		return sql.delete("TT.theaterDelete", emgCode);
	}
}
