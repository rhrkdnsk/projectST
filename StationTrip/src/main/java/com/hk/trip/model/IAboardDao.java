package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.AboardDto;

public interface IAboardDao {

	
	public List<AboardDto> getBoardList(int startNum,int endNum,String akeyWord, String akeyField,int areaboard_code);
	public int getCount(String keyWord, String keyField,int startNum,int endNum,int areaboard_code);
	public boolean insertBoard(AboardDto dto);
	public AboardDto getDetailview(int areaboard_num,int areaboard_code);
	public boolean updateBoard(AboardDto dto);

}
