package com.hk.trip.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.LoginDto;

@Service
public class LoginService implements ILoginService  {

	@Autowired
	private ILoginDao loginDao;

	@Override
	public LoginDto login(LoginDto dto) {
		System.out.println("service");
		// TODO Auto-generated method stub
		return loginDao.login(dto);
	}
}
