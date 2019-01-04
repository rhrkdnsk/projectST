package com.hk.trip.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao implements IScheduleDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.schedule.";
	
}
