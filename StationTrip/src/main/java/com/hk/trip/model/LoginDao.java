package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.LoginDto;

@Repository
public class LoginDao implements ILoginDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.login.";

	@Override
	public LoginDto login(LoginDto dto) {

		System.out.println("dao");
		System.out.println(dto.getEmail());
		System.out.println(dto.getPassword());
		System.out.println("select = " + sqlSession.selectOne(namespace+"login", dto));
		return sqlSession.selectOne(namespace+"login", dto);
	}
}
