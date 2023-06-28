package com.emg.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.emg.movie.dto.SEARCH;
import com.emg.movie.dto.ePAGING;
import com.emg.movie.dto.euDTO;
@Repository
public class eDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void euJoin(euDTO eudto) {
		System.out.println("[3] service → dao " + eudto);
		sql.insert("EU.euJoin",eudto);
	}

	public String idCheck(String euId) {
		
		return sql.selectOne("EU.idCheck",euId);
	}

	public String euLogin(String euId) {
		System.out.println("[3] service → dao " + euId);
		return sql.selectOne("EU.euLogin", euId);
	}

	public int mCount() {
		return sql.selectOne("EU.mCount");
	}

	public List<euDTO> euList(ePAGING paging) {
		return sql.selectList("EU.euList", paging);
	}

	public euDTO euView(String euId) {
		return sql.selectOne("EU.euView", euId);
	}

	public void modify(euDTO eu) {
		System.out.println("[3] service >> dao ");
		sql.update("EU.modify", eu);
		
	}

	public int euDelete(euDTO euId) {
		System.out.println("[3] service >> dao ");
		return sql.delete("EU.euDelete", euId);
	}

	public List<euDTO> euSearch(SEARCH search) {
		return sql.selectList("EU.euSearch",search);
	}

	

}
