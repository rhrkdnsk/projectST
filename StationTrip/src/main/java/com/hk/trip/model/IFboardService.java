package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.FboardDto;

public interface IFboardService {

	
	
	public List<FboardDto> getAllList();
	public boolean insertBoard(FboardDto fdto);
}
