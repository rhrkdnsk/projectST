package com.hk.trip.model;

import com.hk.trip.dto.AdminDto;
import com.hk.trip.dto.LoginDto;

public interface ILoginDao {
	
	public LoginDto login(LoginDto dto);
	public AdminDto admin_login(AdminDto dto);
	public boolean signup(LoginDto dto);
	public LoginDto searchemail(LoginDto dto);
	public boolean resetpw(LoginDto dto);

}
