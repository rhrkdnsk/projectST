package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.InquiryDto;

@Repository
public class InquiryDao implements IInquiryDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.inquiry.";

	@Override
	public boolean user_insert(Map<String, String> map) {
		int count = sqlSession.insert(namespace+"user_inquiry_insert", map);
		return count > 0 ? true:false;
	}


	@Override
	public List<InquiryDto> inquiry_list(Map<String, String>map) {
		// TODO Auto-generated method stub
		System.out.println("dao");
		return sqlSession.selectList(namespace+"inquiry_list", map);
	}


	@Override
	public InquiryDto inquiry_detail(int inquiry_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"inquiry_detail", inquiry_num);
	}
}
