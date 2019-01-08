package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import com.hk.trip.dto.InquiryDto;

public interface IInquiryService {

	public boolean user_insert(Map<String, String>map);
	public List<InquiryDto> inquiry_list(Map<String, String>map);
	public InquiryDto inquiry_detail(int inquiry_num);
	public boolean inquiry_update(InquiryDto idto);
}
