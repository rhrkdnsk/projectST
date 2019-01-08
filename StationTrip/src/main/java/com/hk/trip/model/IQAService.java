package com.hk.trip.model;

import java.util.List;

import com.hk.trip.dto.QADto;

public interface IQAService {
	public List<QADto>qgetAllList();
	public QADto qgetBoard(int faq_num);
	public boolean qinsertBoard(QADto dto);
	public boolean qupdateBoard(QADto dto);
	public boolean qdelBoard(QADto dto);
	public boolean qmulDelBoard(String[] dto);
	public QADto getDetailAjax(QADto dto);
	
	public int qgetCount();
	public List<QADto> qgetBoardList(int startNum,int endNum);
}
