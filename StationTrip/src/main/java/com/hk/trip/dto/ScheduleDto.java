package com.hk.trip.dto;

import java.util.Date;

public class ScheduleDto {

	
	int schedule_num;
	String user_nickname;
	String content_id;
	Date schedule_time;
	int schedule_sequence;
	String schedule_name;
	
	public ScheduleDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ScheduleDto(String user_nickname) {
		super();
		this.user_nickname = user_nickname;
	}

	public ScheduleDto(int schedule_num, String user_nickname, String content_id, Date schedule_time, int schedule_sequence,
			String schedule_name) {
		super();
		this.schedule_num = schedule_num;
		this.user_nickname = user_nickname;
		this.content_id = content_id;
		this.schedule_time = schedule_time;
		this.schedule_sequence = schedule_sequence;
		this.schedule_name = schedule_name;
	}

	@Override
	public String toString() {
		return "ScheduleDto [schedule_num=" + schedule_num + ", user_nickname=" + user_nickname + ", content_id="
				+ content_id + ", schedule_time=" + schedule_time + ", schedule_sequence=" + schedule_sequence
				+ ", schedule_name=" + schedule_name + "]";
	}

	public int getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getContent_id() {
		return content_id;
	}

	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}

	public Date getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(Date schedule_time) {
		this.schedule_time = schedule_time;
	}

	public int getSchedule_sequence() {
		return schedule_sequence;
	}

	public void setSchedule_sequence(int schedule_sequence) {
		this.schedule_sequence = schedule_sequence;
	}

	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	

}
