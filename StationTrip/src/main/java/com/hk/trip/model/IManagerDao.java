package com.hk.trip.model;

import java.util.List;


import com.hk.trip.dto.LoginDto;



public interface IManagerDao {
	public List<LoginDto>sgetAllList();
	public LoginDto sgetBoard(LoginDto dto);
	public boolean sinsertBoard(LoginDto dto);
	public boolean supdateBoard(LoginDto dto);
	public boolean sdelBoard(LoginDto dto);
	public boolean smulDelBoard(String[] dto);
	public LoginDto getDetailAjax(LoginDto dto);
	
	public int sgetCount(int startNum,int endNum);
	public List<LoginDto> sgetBoardList(int startNum,int endNum);
}
