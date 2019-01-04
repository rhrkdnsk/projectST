package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.AboardDto;

@Service
public class AboardService implements IAboardService {

	@Autowired
	private IAboardDao iaboarddao;
	
@Override
	public List<AboardDto> getBoardList(int startNum, int endNum, String akeyWord, String akeyField,
			int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getBoardList(startNum, endNum, akeyWord, akeyField, areaboard_code);
	}	

	@Override
	public int getCount(String akeyWord, String akeyField, int startNum, int endNum, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getCount(akeyWord, akeyField, startNum, endNum, areaboard_code);
	}
	@Override
	public boolean insertBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.insertBoard(dto);
	}
	@Override
	public AboardDto getDetailview(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getDetailview(areaboard_num, areaboard_code);
	}
	@Override
	public boolean updateBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.updateBoard(dto);
	}
}
