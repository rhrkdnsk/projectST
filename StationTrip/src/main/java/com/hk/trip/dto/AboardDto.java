package com.hk.trip.dto;

import java.sql.Date;

public class AboardDto {
	private int areaboard_num;
	private String user_nickname;
	private int areaboard_code;
	private String areaboard_title;
	private Date areaboard_time;
	private String areaboard_content;
	private int areaboard_view;
	private int areaboard_like;
	private int areaboard_hate;
	private String areaboard_category;
	private int areaboard_commentcount;
	
	public AboardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AboardDto(int areaboard_num, String user_nickname, int areaboard_code, String areaboard_title,
			Date areaboard_time, String areaboard_content, int areaboard_view, int areaboard_like, int areaboard_hate,
			String areaboard_category, int areaboard_commentcount) {
		super();
		this.areaboard_num = areaboard_num;
		this.user_nickname = user_nickname;
		this.areaboard_code = areaboard_code;
		this.areaboard_title = areaboard_title;
		this.areaboard_time = areaboard_time;
		this.areaboard_content = areaboard_content;
		this.areaboard_view = areaboard_view;
		this.areaboard_like = areaboard_like;
		this.areaboard_hate = areaboard_hate;
		this.areaboard_category = areaboard_category;
		this.areaboard_commentcount = areaboard_commentcount;
	}

	@Override
	public String toString() {
		return "AboardDto [areaboard_num=" + areaboard_num + ", user_nickname=" + user_nickname + ", areaboard_code="
				+ areaboard_code + ", areaboard_title=" + areaboard_title + ", areaboard_time=" + areaboard_time
				+ ", areaboard_content=" + areaboard_content + ", areaboard_view=" + areaboard_view
				+ ", areaboard_like=" + areaboard_like + ", areaboard_hate=" + areaboard_hate + ", areaboard_category="
				+ areaboard_category + ", areaboard_commentcount=" + areaboard_commentcount + "]";
	}

	public int getAreaboard_num() {
		return areaboard_num;
	}

	public void setAreaboard_num(int areaboard_num) {
		this.areaboard_num = areaboard_num;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getAreaboard_code() {
		return areaboard_code;
	}

	public void setAreaboard_code(int areaboard_code) {
		this.areaboard_code = areaboard_code;
	}

	public String getAreaboard_title() {
		return areaboard_title;
	}

	public void setAreaboard_title(String areaboard_title) {
		this.areaboard_title = areaboard_title;
	}

	public Date getAreaboard_time() {
		return areaboard_time;
	}

	public void setAreaboard_time(Date areaboard_time) {
		this.areaboard_time = areaboard_time;
	}

	public String getAreaboard_content() {
		return areaboard_content;
	}

	public void setAreaboard_content(String areaboard_content) {
		this.areaboard_content = areaboard_content;
	}

	public int getAreaboard_view() {
		return areaboard_view;
	}

	public void setAreaboard_view(int areaboard_view) {
		this.areaboard_view = areaboard_view;
	}

	public int getAreaboard_like() {
		return areaboard_like;
	}

	public void setAreaboard_like(int areaboard_like) {
		this.areaboard_like = areaboard_like;
	}

	public int getAreaboard_hate() {
		return areaboard_hate;
	}

	public void setAreaboard_hate(int areaboard_hate) {
		this.areaboard_hate = areaboard_hate;
	}

	public String getAreaboard_category() {
		return areaboard_category;
	}

	public void setAreaboard_category(String areaboard_category) {
		this.areaboard_category = areaboard_category;
	}

	public int getAreaboard_commentcount() {
		return areaboard_commentcount;
	}

	public void setAreaboard_commentcount(int areaboard_commentcount) {
		this.areaboard_commentcount = areaboard_commentcount;
	}
	
	
	
	
}
