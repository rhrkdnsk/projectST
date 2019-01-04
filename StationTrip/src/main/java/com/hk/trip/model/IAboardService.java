package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.AboardDto;



public interface IAboardService {

	public List<AboardDto> getBoardList(int startNum,int endNum,String akeyWord, String akeyField,int areaboard_code);
	public int getCount(String akeyWord, String akeyField,int startNum,int endNum,int areaboard_code);
	
	
}
