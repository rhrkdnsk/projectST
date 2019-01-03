package com.hk.trip.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.LoginDto;

@Repository
public class MembershipDao implements IMembershipDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.membership.";

	@Override
	public LoginDto myInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		//System.out.println("dao nickname = "+map.get("user_nickname"));
		return sqlSession.selectOne(namespace+"myinfo", map);
	}

	@Override
	public boolean pwChange(LoginDto dto) {
		int count = sqlSession.update(namespace+"pwchange", dto);
		return count > 0 ? true:false;
	}

	@Override
	public boolean withdrawal(LoginDto dto) {
		int count = sqlSession.update(namespace+"withdrawal", dto);
		return count > 0 ? true:false;
	}

	@Override
	public boolean nickChange(LoginDto dto) {
		int count = sqlSession.update(namespace+"nickchange", dto);
		return count > 0 ? true:false;
	}

	@Override
	public boolean phoneChange(LoginDto dto) {
		int count = sqlSession.update(namespace+"phonechange", dto);
		return count > 0 ? true:false;
	}
	
	
}
