package com.hk.trip.dto;

import java.util.Date;

public class InquiryDto {

	int inquiry_num;
	String inquiry_title;
	Date inquiry_time;
	String inquiry_content;
	int inquiry_depth;
	int inquiry_refer;
	String admin_id;
	String user_nickname;
	
	public InquiryDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InquiryDto(int inquiry_num, String inquiry_title, Date inquiry_time, String inquiry_content,
			int inquiry_depth, int inquiry_refer, String admin_id, String user_nickname) {
		super();
		this.inquiry_num = inquiry_num;
		this.inquiry_title = inquiry_title;
		this.inquiry_time = inquiry_time;
		this.inquiry_content = inquiry_content;
		this.inquiry_depth = inquiry_depth;
		this.inquiry_refer = inquiry_refer;
		this.admin_id = admin_id;
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "inquiryDto [inquiry_num=" + inquiry_num + ", inquiry_title=" + inquiry_title + ", inquiry_time="
				+ inquiry_time + ", inquiry_content=" + inquiry_content + ", inquiry_depth=" + inquiry_depth
				+ ", inquiry_refer=" + inquiry_refer + ", admin_id=" + admin_id + ", user_nickname=" + user_nickname
				+ "]";
	}

	public int getInquiry_num() {
		return inquiry_num;
	}

	public void setInquiry_num(int inquiry_num) {
		this.inquiry_num = inquiry_num;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public Date getInquiry_time() {
		return inquiry_time;
	}

	public void setInquiry_time(Date inquiry_time) {
		this.inquiry_time = inquiry_time;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public int getInquiry_depth() {
		return inquiry_depth;
	}

	public void setInquiry_depth(int inquiry_depth) {
		this.inquiry_depth = inquiry_depth;
	}

	public int getInquiry_refer() {
		return inquiry_refer;
	}

	public void setInquiry_refer(int inquiry_refer) {
		this.inquiry_refer = inquiry_refer;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
}
