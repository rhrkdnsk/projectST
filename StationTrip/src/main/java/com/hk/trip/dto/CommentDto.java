package com.hk.trip.dto;

import java.sql.Date;

public class CommentDto {
	private int comment_num;
	private int freeboard_num;
	private int areaboard_num;
	private String user_nickname;
	private Date comment_time;
	private int comment_depth;
	private int comment_step;
	private int comment_refer;
	private String comment_content;
	private int comment_like;
	private int comment_count;
	
	
	public CommentDto() {
		super();
	}
	public CommentDto(int comment_num, int freeboard_num, int areaboard_num, String user_nickname, Date comment_time,
			int comment_depth, int comment_step, int comment_refer, String comment_content, int comment_like,
			int comment_count) {
		super();
		this.comment_num = comment_num;
		this.freeboard_num = freeboard_num;
		this.areaboard_num = areaboard_num;
		this.user_nickname = user_nickname;
		this.comment_time = comment_time;
		this.comment_depth = comment_depth;
		this.comment_step = comment_step;
		this.comment_refer = comment_refer;
		this.comment_content = comment_content;
		this.comment_like = comment_like;
		this.comment_count = comment_count;
	}
	@Override
	public String toString() {
		return "CommentDto [comment_num=" + comment_num + ", freeboard_num=" + freeboard_num + ", areaboard_num="
				+ areaboard_num + ", user_nickname=" + user_nickname + ", comment_time=" + comment_time
				+ ", comment_depth=" + comment_depth + ", comment_step=" + comment_step + ", comment_refer="
				+ comment_refer + ", comment_content=" + comment_content + ", comment_like=" + comment_like
				+ ", comment_count=" + comment_count + "]";
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getFreeboard_num() {
		return freeboard_num;
	}
	public void setFreeboard_num(int freeboard_num) {
		this.freeboard_num = freeboard_num;
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
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	public int getComment_depth() {
		return comment_depth;
	}
	public void setComment_depth(int comment_depth) {
		this.comment_depth = comment_depth;
	}
	public int getComment_step() {
		return comment_step;
	}
	public void setComment_step(int comment_step) {
		this.comment_step = comment_step;
	}
	public int getComment_refer() {
		return comment_refer;
	}
	public void setComment_refer(int comment_refer) {
		this.comment_refer = comment_refer;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_like() {
		return comment_like;
	}
	public void setComment_like(int comment_like) {
		this.comment_like = comment_like;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
	
}
