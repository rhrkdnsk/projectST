package com.hk.trip.dto;

public class QADto {
	private int faq_num;
	private	String faq_title;
	private String faq_content;
	
	public QADto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QADto(int faq_num, String faq_title, String faq_content) {
		super();
		this.faq_num = faq_num;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "QADto [faq_num=" + faq_num + ", faq_title=" + faq_title + ", faq_content=" + faq_content + "]";
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
}
