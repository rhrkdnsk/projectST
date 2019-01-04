package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.RhksflDto;
@Service
public class RhkflService implements IRhkflService{
	@Autowired
	IRhkflDao rhksflDao;
	@Override
	public List<RhksflDto> rgetAllList() {
		// TODO Auto-generated method stub
		return rhksflDao.rgetAllList();
	}

	@Override
	public RhksflDto rgetBoard(int seq) {
		// TODO Auto-generated method stub
		return rhksflDao.rgetBoard(seq);
	}

	@Override
	public boolean rinsertBoard(RhksflDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean rupdateBoard(RhksflDto dto) {
		// TODO Auto-generated method stub
		return rhksflDao.rupdateBoard(dto);
	}

	@Override
	public boolean rdelBoard(RhksflDto dto) {
		// TODO Auto-generated method stub
		return rhksflDao.rdelBoard(dto);
	}

	@Override
	public boolean rmulDelBoard(String[] dto) {
		// TODO Auto-generated method stub
		return rhksflDao.rmulDelBoard(dto);
	}

	@Override
	public RhksflDto getDetailAjax(RhksflDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int rgetCount() {
		// TODO Auto-generated method stub
		return rhksflDao.rgetCount();
	}

	@Override
	public List<RhksflDto> rgetBoardList(int startNum, int endNum) {
		// TODO Auto-generated method stub
		return rhksflDao.rgetBoardList(startNum, endNum);
	}

}
