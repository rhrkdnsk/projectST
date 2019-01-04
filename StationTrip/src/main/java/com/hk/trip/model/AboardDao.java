package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.AboardDto;

@Repository
public class AboardDao implements IAboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.aboard.";
	
	
	@Override
	public List<AboardDto> getBoardList(int startNum, int endNum, String akeyWord, String akeyField,
			int areaboard_code) {
		Map<String, String> map = new HashMap<String, String>();	
		if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "" ) {
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyField", akeyField);
			map.put("keyWord", akeyWord);
			map.put("areaboard_code", areaboard_code+"");
			return sqlSession.selectList(namespace + "agetSearchlist", map);
		} else {
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("areaboard_code", areaboard_code+"");

		//System.out.println (sqlSession.selectList(namespace + "getNumlist", map));

		return sqlSession.selectList(namespace + "agetNumlist", map);
		
		
	}

	}
	
	@Override
	public int getCount(String akeyWord, String akeyField, int startNum, int endNum, int areaboard_code) {
		// TODO Auto-generated method stub
		if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "" ) {
			System.out.println("Dao에서 if문 실행");
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyField", akeyField);
			map.put("keyWord", akeyWord);
			map.put("areaboard_code", areaboard_code+"");
			int asd =  sqlSession.selectOne(namespace + "agetSearchCount", map);
			//System.out.println(asd);
			return asd;
		} else {
			System.out.println(sqlSession.selectOne(namespace + "agetCount"));
			return sqlSession.selectOne(namespace + "agetCount");

		}	
		
	}
	
	} //끝
