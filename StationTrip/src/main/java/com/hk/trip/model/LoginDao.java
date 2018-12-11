package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao implements ILoginDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.login.";
}
