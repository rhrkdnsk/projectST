package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hk.trip.dto.LoginDto;
@Service
public class ManagerService implements IManagerService{
	@Autowired
	IManagerDao managerDao;
	@Override
	public List<LoginDto> sgetAllList() {
		// TODO Auto-generated method stub
		return managerDao.sgetAllList();
	}

	@Override
	public LoginDto sgetBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return managerDao.sgetBoard(dto);
	}

	@Override
	public boolean sinsertBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean supdateBoard(LoginDto dto) {
		return managerDao.supdateBoard(dto);
	}

	@Override
	public boolean sdelBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return managerDao.sdelBoard(dto);
	}

	@Override
	public LoginDto getDetailAjax(LoginDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean smulDelBoard(String[] dto) {
		return managerDao.smulDelBoard(dto);
	}
	
	@Override
	public int sgetCount(int startNum,int endNum) {
		// TODO Auto-generated method stub
		return managerDao.sgetCount(startNum,endNum);
	}
	@Override
	public List<LoginDto> sgetBoardList(int startNum,int endNum) {
		// TODO Auto-generated method stub
		return managerDao.sgetBoardList(startNum,endNum);
	}
}
