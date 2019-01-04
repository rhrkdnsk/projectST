package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.ScheduleDto;

@Repository
public class ScheduleDao implements IScheduleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.schedule.";

	@Override
	public ScheduleDto scCheck(ScheduleDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"sc_check", dto);
	}
	
}
