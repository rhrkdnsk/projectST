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
	public List<LoginDto> getAllList() {
		// TODO Auto-generated method stub
		return managerDao.getAllList();
	}

	@Override
	public LoginDto getBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return managerDao.getBoard(dto);
	}

	@Override
	public boolean insertBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delBoard(LoginDto dto) {
		// TODO Auto-generated method stub
		return managerDao.delBoard(dto);
	}

	@Override
	public LoginDto getDetailAjax(LoginDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
