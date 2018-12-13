package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

public interface IFboardService {

	
	
	public List<FboardDto> getAllList();
	public boolean insertBoard(FboardDto fdto);
	public FboardDto getDetailView(int freeboard_num);
	public List<CommentDto> getReply(int freeboard_num);
	public boolean upDateBoard(FboardDto fdto);
}
