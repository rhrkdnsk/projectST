package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.AdminDto;
import com.hk.trip.dto.LoginDto;

@Repository
public class LoginDao implements ILoginDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.login.";

	@Override
	public LoginDto login(LoginDto dto) {

//		System.out.println("dao");
//		System.out.println(dto.getUser_email());
//		System.out.println(dto.getUser_password());
//		System.out.println("select = " + sqlSession.selectOne(namespace+"login", dto));
		return sqlSession.selectOne(namespace+"login", dto);
	}

	@Override
	public boolean signup(LoginDto dto) {
		
		int count = sqlSession.insert(namespace+"signup", dto);

		return count > 0 ? true:false;
	}

	@Override
	public LoginDto searchemail(LoginDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"searchemail", dto);
	}

	@Override
	public boolean resetpw(LoginDto dto) {
		int count = sqlSession.update(namespace+"resetpw", dto);
		return count > 0 ? true:false;
	}

	@Override
	public AdminDto admin_login(AdminDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"admin_login", dto);
	}
}
