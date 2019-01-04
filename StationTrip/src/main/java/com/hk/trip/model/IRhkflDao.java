package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.RhksflDto;



public interface IRhkflDao {
	public List<RhksflDto>rgetAllList();
	public RhksflDto rgetBoard(int seq);
	public boolean rinsertBoard(RhksflDto dto);
	public boolean rupdateBoard(RhksflDto dto);
	public boolean rdelBoard(RhksflDto dto);
	public boolean rmulDelBoard(String[] dto);
	public RhksflDto getDetailAjax(RhksflDto dto);
	
	public int rgetCount();
	public List<RhksflDto> rgetBoardList(int startNum,int endNum);
}
