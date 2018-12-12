package com.hk.trip.dto;

public class LoginDto {

	String nickname;
	String tier;
	String email;
	String name;
	String password;
	String phone;
	int point;
	int alarmnum;
	
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginDto(String nickname, String tier, String email, String name, String password, String phone, int point,
			int alarmnum) {
		super();
		this.nickname = nickname;
		this.tier = tier;
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.point = point;
		this.alarmnum = alarmnum;
	}
	
	public LoginDto(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginDto [nickname=" + nickname + ", tier=" + tier + ", email=" + email + ", name=" + name
				+ ", password=" + password + ", phone=" + phone + ", point=" + point + ", alarmnum=" + alarmnum + "]";
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getAlarmnum() {
		return alarmnum;
	}

	public void setAlarmnum(int alarmnum) {
		this.alarmnum = alarmnum;
	}
	
	
	
}
