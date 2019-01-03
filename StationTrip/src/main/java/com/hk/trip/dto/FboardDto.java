package com.hk.trip.dto;

import java.sql.Date;

public class FboardDto {
	private int freeboard_num;
	private String user_nickname;
	private String freeboard_title;
	private Date freeboard_time;
	private String freeboard_content;
	private int freeboard_view;
	private int freeboard_like;
	private int freeboard_hate;
	private String freeboard_category;
	private int freeboard_commentcount;
	
	public FboardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FboardDto(int freeboard_num, String user_nickname, String freeboard_title, Date freeboard_time,
			String freeboard_content, int freeboard_view, int freeboard_like, int freeboard_hate,
			String freeboard_category, int freeboard_commentcount) {
		super();
		this.freeboard_num = freeboard_num;
		this.user_nickname = user_nickname;
		this.freeboard_title = freeboard_title;
		this.freeboard_time = freeboard_time;
		this.freeboard_content = freeboard_content;
		this.freeboard_view = freeboard_view;
		this.freeboard_like = freeboard_like;
		this.freeboard_hate = freeboard_hate;
		this.freeboard_category = freeboard_category;
		this.freeboard_commentcount = freeboard_commentcount;
	}

	@Override
	public String toString() {
		return "FboardDto [freeboard_num=" + freeboard_num + ", user_nickname=" + user_nickname + ", freeboard_title="
				+ freeboard_title + ", freeboard_time=" + freeboard_time + ", freeboard_content=" + freeboard_content
				+ ", freeboard_view=" + freeboard_view + ", freeboard_like=" + freeboard_like + ", freeboard_hate="
				+ freeboard_hate + ", freeboard_category=" + freeboard_category + ", freeboard_commentcount="
				+ freeboard_commentcount + "]";
	}

	public int getFreeboard_num() {
		return freeboard_num;
	}

	public void setFreeboard_num(int freeboard_num) {
		this.freeboard_num = freeboard_num;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getFreeboard_title() {
		return freeboard_title;
	}

	public void setFreeboard_title(String freeboard_title) {
		this.freeboard_title = freeboard_title;
	}

	public Date getFreeboard_time() {
		return freeboard_time;
	}

	public void setFreeboard_time(Date freeboard_time) {
		this.freeboard_time = freeboard_time;
	}

	public String getFreeboard_content() {
		return freeboard_content;
	}

	public void setFreeboard_content(String freeboard_content) {
		this.freeboard_content = freeboard_content;
	}

	public int getFreeboard_view() {
		return freeboard_view;
	}

	public void setFreeboard_view(int freeboard_view) {
		this.freeboard_view = freeboard_view;
	}

	public int getFreeboard_like() {
		return freeboard_like;
	}

	public void setFreeboard_like(int freeboard_like) {
		this.freeboard_like = freeboard_like;
	}

	public int getFreeboard_hate() {
		return freeboard_hate;
	}

	public void setFreeboard_hate(int freeboard_hate) {
		this.freeboard_hate = freeboard_hate;
	}

	public String getFreeboard_category() {
		return freeboard_category;
	}

	public void setFreeboard_category(String freeboard_category) {
		this.freeboard_category = freeboard_category;
	}

	public int getFreeboard_commentcount() {
		return freeboard_commentcount;
	}

	public void setFreeboard_commentcount(int freeboard_commentcount) {
		this.freeboard_commentcount = freeboard_commentcount;
	}
	
	
	
	
	
}
