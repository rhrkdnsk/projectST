package com.hk.trip.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.ScheduleDto;

@Service
public class ScheduleService implements IScheduleService {

	
	@Autowired
	private IScheduleDao sc_dao;

	@Override
	public ScheduleDto scCheck(ScheduleDto dto) {
		// TODO Auto-generated method stub
		return sc_dao.scCheck(dto);
	}
}
