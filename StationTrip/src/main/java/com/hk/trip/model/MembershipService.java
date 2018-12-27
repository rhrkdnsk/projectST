package com.hk.trip.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.LoginDto;

@Service
public class MembershipService implements IMembershipService {

	@Autowired
	private IMembershipDao mDao;

	@Override
	public LoginDto myInfo(Map<String, String> map) {
		// TODO Auto-generated method stub
		System.out.println("Service nickname = "+map.get("user_nickname"));
		return mDao.myInfo(map);
	}

	@Override
	public boolean pwChange(LoginDto dto) {
		// TODO Auto-generated method stub
		return mDao.pwChange(dto);
	}

	@Override
	public boolean withdrawal(LoginDto dto) {
		// TODO Auto-generated method stub
		return mDao.withdrawal(dto);
	}
}
