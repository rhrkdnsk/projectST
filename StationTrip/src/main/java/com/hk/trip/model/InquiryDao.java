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
		System.out.println("user_nickname = "+map.get("user_nickname"));
		System.out.println("startNum = "+map.get("startNum"));
		System.out.println("endNum = "+map.get("endNum"));
		return sqlSession.selectList(namespace+"inquiry_list", map);
	}


	@Override
	public InquiryDto inquiry_detail(int inquiry_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"inquiry_detail", inquiry_num);
	}


	@Override
	public boolean inquiry_update(InquiryDto idto) {
		int count = sqlSession.update(namespace+"inquiry_update", idto);
		return count > 0 ? true:false;
	}


	@Override
	public List<InquiryDto> admin_inquiry_list(Map<String, String>map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"admin_inquiry_list", map);
	}


	@Override
	public boolean admin_insert(InquiryDto idto) {
		int count = sqlSession.insert(namespace+"admin_inquiry_insert", idto);
		return count > 0 ? true:false;
	}
	
	@Override
	public int getCount(Map<String, String>map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "inquiry_getCount",map);

		//System.out.println("getCount 값 :" + sqlSession.selectOne(namespace + "getCount"));
		
	}


	@Override
	public int admin_getCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"admin_inquiry_getCount");
	}


	@Override
	public void inquiry_nickname(Map<String, String> map) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"inquiry_nickname", map);
		
	}
}
