package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.QADto;
@Repository
public class QADao implements IQADao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.trip.qa.";
	@Override
	public List<QADto> qgetAllList() {
		return sqlSession.selectList(namespace+"qgetAllList");
	}

	@Override
	public QADto qgetBoard(int faq_num) {
		return sqlSession.selectOne(namespace+"qgetBoard", faq_num);

	}

	@Override
	public boolean qinsertBoard(QADto dto) {
		System.out.println(dto);
		int count=0;
		count=sqlSession.insert(namespace+"qinsertBoard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean qupdateBoard(QADto dto) {
		int count=0;
		System.out.println(dto);
		count=sqlSession.update(namespace+"qupdateBoard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean qdelBoard(QADto dto) {
		int count=0;
		count=sqlSession.update(namespace+"qdelBoard", dto);
		return count>0?true:false;
	}


	@Override
	public boolean qmulDelBoard(String[] dto) {
		Map<String, String[]>map=new HashMap<String, String[]>();
		map.put("faq_num", dto);
		int count=0;
		count=sqlSession.update(namespace+"qmulDelBoard", map);
		return count>0?true:false;
	}
	@Override
	public QADto getDetailAjax(QADto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qgetCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QADto> qgetBoardList(int startNum, int endNum) {
		Map<String, String> map = new HashMap<String, String>();	
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		return sqlSession.selectList(namespace + "qgetNumlist", map);
		}

}
