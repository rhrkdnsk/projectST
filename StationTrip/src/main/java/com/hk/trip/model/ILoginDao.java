package com.hk.trip.model;

import com.hk.trip.dto.LoginDto;

public interface ILoginDao {
	
	public LoginDto login(LoginDto dto);
	public boolean signup(LoginDto dto);
	public LoginDto searchemail(LoginDto dto);
	public boolean resetpw(LoginDto dto);

}
