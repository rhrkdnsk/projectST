package com.hk.trip.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.FboardDto;

@Repository
public class FboardDao implements IFboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.fboard.";
	
	@Override
	public List<FboardDto> getAllList()	{
		return sqlSession.selectList(namespace + "getAllContent" );
	}
	
	@Override
	public boolean insertBoard(FboardDto fdto) {
		int count = 0;
		
		count = sqlSession.insert(namespace + "insertBoard" , fdto);
		return count > 0? true:false;
	}
	public int getLastNum() {
		int lastNum=0;
		sqlSession.selectList(namespace, "getLastNum");
		
		return lastNum;
		
	}
}
