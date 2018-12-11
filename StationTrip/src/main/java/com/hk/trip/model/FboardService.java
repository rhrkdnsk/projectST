package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.FboardDto;

@Service
public class FboardService implements IFboardService {

	@Autowired
	private IFboardDao ifboarddao;
	
	@Override
	public List<FboardDto> getAllList()	 {
		return ifboarddao.getAllList();
	}
}
