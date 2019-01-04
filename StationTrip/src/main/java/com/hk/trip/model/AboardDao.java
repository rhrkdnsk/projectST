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
			map.put("akeyField", akeyField);
			map.put("akeyWord", akeyWord);
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
			System.out.println("Dao startNum : " + startNum + "endNum : " + endNum + "akeyField : " + akeyField + "akeyWord : " + akeyWord + "areaboard_code : " + areaboard_code);
			Map<String, String> map = new HashMap<String, String>();
			map.put("akeyWord", akeyWord);
			map.put("akeyField", akeyField);
//			map.put("startNum", startNum+"");
//			map.put("endNum", endNum+"");
			map.put("areaboard_code", areaboard_code+"");
			System.out.println(map);
			System.out.println("Dao getCount 실행결과 : " + sqlSession.selectOne(namespace + "agetSearchCount", map));
			int asd =  sqlSession.selectOne(namespace + "agetSearchCount", map);
			return asd;
		} else {
			System.out.println(sqlSession.selectOne(namespace + "agetCount"));
			return sqlSession.selectOne(namespace + "agetCount");

		}	
		
	}
	@Override
	public boolean insertBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		System.out.println(dto);
		count = sqlSession.insert(namespace + "ainsertBoard", dto);
		
		return count > 0 ? true : false;
	}
	} //끝
