package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.InquiryDto;

@Service
public class InquiryService implements IInquiryService{

	
	@Autowired
	private IInquiryDao iDao;

	@Override
	public boolean user_insert(Map<String, String> map) {
		// TODO Auto-generated method stub
		return iDao.user_insert(map);
	}

	@Override
	public List<InquiryDto> inquiry_list(Map<String, String>map) {
		// TODO Auto-generated method stub
		System.out.println("service");
		return iDao.inquiry_list(map);
	}

	@Override
	public InquiryDto inquiry_detail(int inquiry_num) {
		// TODO Auto-generated method stub
		return iDao.inquiry_detail(inquiry_num);
	}

	@Override
	public boolean inquiry_update(InquiryDto idto) {
		// TODO Auto-generated method stub
		return iDao.inquiry_update(idto);
	}
}
