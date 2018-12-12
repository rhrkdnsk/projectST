package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.LoginDto;

@Repository
public class LoginDao implements ILoginDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.login.";

	@Override
	public boolean login(String email, String password) {
		
		boolean isS = sqlSession.selectOne(namespace+"login", new LoginDto(email,password));
		
		return isS;
	}
}
