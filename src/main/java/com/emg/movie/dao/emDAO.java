package com.emg.movie.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.emg.movie.dto.SEARCH;
import com.emg.movie.dto.cmtMDTO;
import com.emg.movie.dto.ePAGING;
import com.emg.movie.dto.emDTO;
import com.emg.movie.dto.kDTO;

@Repository
public class emDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void Movie(emDTO emdto) {
		System.out.println("[3] service → dao " + emdto);
		sql.insert("EM.Moive",emdto);
	}

	public int mCount() {
		
		return sql.selectOne("EM.mCount");
	}

	public List<emDTO> movielist(ePAGING paging) {
		
		System.out.println("[3] service → dao ");
		return sql.selectList("EM.movielist",paging);
	}

	public emDTO mView(int mCode) {
		// TODO Auto-generated method stub
		return sql.selectOne("EM.mView", mCode);
	}

	public int delete(emDTO mCode) {
		
		return sql.delete("EM.delete",mCode);
	}

	public void mModify(emDTO emdto) {
		
		sql.update("EM.mModify",emdto);
		
	}

	public List<emDTO> movieSearch(SEARCH search) {
		
		return sql.selectList("EM.searchList",search);
	}


	public void cWrite(cmtMDTO comment) {
		sql.insert("EM.cWrite", comment);		
	}
	

	public List<cmtMDTO> cList(int mCode) {
		return sql.selectList("EM.cList", mCode);
	}

	public void cModify(cmtMDTO comment) {
		sql.update("EM.cModify", comment);		
	}

	public void cDelete(cmtMDTO comment) {
		sql.delete("EM.cDelete", comment);
	}

	public List<emDTO> mList() {
		// TODO Auto-generated method stub
		return sql.selectList("EM.mList");
	}






	




}
