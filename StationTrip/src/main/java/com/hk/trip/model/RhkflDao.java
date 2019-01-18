package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.RhksflDto;
@Repository
public class RhkflDao implements IRhkflDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.trip.rhksfl.";

	@Override
	public List<RhksflDto> rgetAllList() {
		return sqlSession.selectList(namespace+"rgetAllList");
	}

	@Override
	public RhksflDto rgetBoard(int seq) {
		return sqlSession.selectOne(namespace+"rgetBoard", seq);
	}

	@Override
	public boolean rinsertBoard(RhksflDto dto) {
		System.out.println(dto);
		int count=0;
		count=sqlSession.insert(namespace+"rinsertBoard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean rupdateBoard(RhksflDto dto) {
		int count=0;
		System.out.println(dto);
		count=sqlSession.update(namespace+"rupdateBoard", dto);
		return count>0?true:false;
		
	}

	@Override
	public boolean rdelBoard(RhksflDto dto) {
		int count=0;
		count=sqlSession.update(namespace+"rdelBoard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean rmulDelBoard(String[] dto) {
		Map<String, String[]>map=new HashMap<String, String[]>();
		map.put("seq", dto);
		int count=0;
		count=sqlSession.update(namespace+"rmulDelBoard", map);
		return count>0?true:false;
	}

	@Override
	public RhksflDto getDetailAjax(RhksflDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int rgetCount() {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne(namespace + "rgetCount");	
	}

	@Override
	public List<RhksflDto> rgetBoardList(int startNum, int endNum) {
		Map<String, String> map = new HashMap<String, String>();	
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		return sqlSession.selectList(namespace + "rgetNumlist", map);
		}
	
}
