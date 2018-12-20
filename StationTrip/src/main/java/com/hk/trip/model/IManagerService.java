package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.LoginDto;

public interface IManagerService {
	public List<LoginDto>sgetAllList();
	public  LoginDto sgetBoard(LoginDto dto);
	public boolean sinsertBoard(LoginDto dto);
	public boolean supdateBoard(LoginDto dto);
	public boolean sdelBoard(LoginDto dto);
	public LoginDto getDetailAjax(LoginDto dto);
}
