package com.hk.trip.model;

import java.util.Map;

import com.hk.trip.dto.LoginDto;

public interface IMembershipService {

	public LoginDto myInfo(Map<String, String> map);
	public boolean pwChange(Map<String, String> map);
	public boolean nickChange(LoginDto dto);
	public boolean phoneChange(LoginDto dto);
	public boolean withdrawal(LoginDto dto);
}
