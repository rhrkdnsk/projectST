package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.LoginDto;

public interface IManagerService {
	public List<LoginDto>getAllList();
	public  LoginDto getBoard(LoginDto dto);
	public boolean insertBoard(LoginDto dto);
	public boolean updateBoard(LoginDto dto);
	public boolean delBoard(LoginDto dto);
	public LoginDto getDetailAjax(LoginDto dto);
}
