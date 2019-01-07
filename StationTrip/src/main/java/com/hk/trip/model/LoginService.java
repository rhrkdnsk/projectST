package com.hk.trip.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.AdminDto;
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

	@Override
	public boolean signup(LoginDto dto) {
		
		return loginDao.signup(dto);
	}

	@Override
	public LoginDto searchemail(LoginDto dto) {
		// TODO Auto-generated method stub
		return loginDao.searchemail(dto);
	}

	@Override
	public boolean resetpw(LoginDto dto) {
		// TODO Auto-generated method stub
		return loginDao.resetpw(dto);
	}

	@Override
	public AdminDto admin_login(AdminDto dto) {
		// TODO Auto-generated method stub
		return loginDao.admin_login(dto);
	}
}
