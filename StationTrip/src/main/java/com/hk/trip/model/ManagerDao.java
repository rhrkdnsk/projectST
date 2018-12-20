package com.hk.trip.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.LoginDto;
@Repository
public class ManagerDao implements IManagerDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.trip.manager.";
	
	@Override
	public List<LoginDto> sgetAllList() {
		return sqlSession.selectList(namespace+"sgetAllList");
	}

	@Override
	public LoginDto sgetBoard(LoginDto dto) {
		return sqlSession.selectOne(namespace+"sgetBoard", dto);
	}

	@Override
	public boolean sinsertBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean supdateBoard(LoginDto dto) {
		int count=0;
		System.out.println(dto);
		count=sqlSession.update(namespace+"supdateBoard", dto);
		return count>0?true:false;
	}

	@Override
	public boolean sdelBoard(LoginDto dto) {
		int count=0;
		count=sqlSession.update(namespace+"sdelBoard", dto);
		return count>0?true:false;
	}

	@Override
	public LoginDto getDetailAjax(LoginDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
