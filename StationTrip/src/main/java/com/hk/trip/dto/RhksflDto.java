package com.hk.trip.dto;

import java.util.Date;

public class RhksflDto {
	private int seq;
	private String title;
	private String id;
	private String content;
	private Date regdate;
	
	public RhksflDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RhksflDto(int seq, String title, String id, String content, Date regdate) {
		super();
		this.seq = seq;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "RhksflDto [seq=" + seq + ", title=" + title + ", id=" + id + ", content=" + content + ", regdate="
				+ regdate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
