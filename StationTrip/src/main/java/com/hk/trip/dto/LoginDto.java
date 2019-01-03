package com.hk.trip.dto;

public class LoginDto {

	String user_nickname;
	String tier;
	String user_email;
	String user_name;
	String user_password;
	String user_phone;
	int user_point;
	int user_alarmnum;
	
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public LoginDto(String user_email, String user_password) {
		super();
		this.user_email = user_email;
		this.user_password = user_password;
	}
	
	


	public LoginDto(String user_nickname, String user_email, String user_phone) {
		super();
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}


	public LoginDto(String user_nickname, String tier, String user_email, String user_name, String user_password,
			String user_phone, int user_point, int user_alarmnum) {
		super();
		this.user_nickname = user_nickname;
		this.tier = tier;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_phone = user_phone;
		this.user_point = user_point;
		this.user_alarmnum = user_alarmnum;
	}


	@Override
	public String toString() {
		return "LoginDto [user_nickname=" + user_nickname + ", tier=" + tier + ", user_email=" + user_email
				+ ", user_name=" + user_name + ", user_password=" + user_password + ", user_phone=" + user_phone
				+ ", user_point=" + user_point + ", user_alarmnum=" + user_alarmnum + "]";
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	public String getTier() {
		return tier;
	}


	public void setTier(String tier) {
		this.tier = tier;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public int getUser_point() {
		return user_point;
	}


	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}


	public int getUser_alarmnum() {
		return user_alarmnum;
	}


	public void setUser_alarmnum(int user_alarmnum) {
		this.user_alarmnum = user_alarmnum;
	}
}