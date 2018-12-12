package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

@Service
public class FboardService implements IFboardService {

	@Autowired
	private IFboardDao ifboarddao;
	
	@Override
	public List<FboardDto> getAllList()	 {
		return ifboarddao.getAllList();
	}
	
	@Override
	public boolean insertBoard(FboardDto fdto) {
		return ifboarddao.insertBoard(fdto);
	}
	@Override
	public FboardDto getDetailView(int freeboard_num) {
		return ifboarddao.getDetailView(freeboard_num);
	}
	
	@Override
	public List<CommentDto> getReply(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.getReply(freeboard_num);
	}
}
