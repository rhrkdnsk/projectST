package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.QADto;
@Service
public class QAService implements IQAService{
	
	@Autowired
	IQADao QADao;
	
	@Override
	public List<QADto> qgetAllList() {
		return QADao.qgetAllList();
	}

	@Override
	public QADto qgetBoard(int faq_num) {
		// TODO Auto-generated method stub
		return QADao.qgetBoard(faq_num);
	}

	@Override
	public boolean qinsertBoard(QADto dto) {
		// TODO Auto-generated method stub
		return QADao.qinsertBoard(dto);
	}

	@Override
	public boolean qupdateBoard(QADto dto) {
		return QADao.qupdateBoard(dto);
	}

	@Override
	public boolean qdelBoard(QADto dto) {
		return QADao.qdelBoard(dto);
	}

	@Override
	public boolean qmulDelBoard(String[] dto) {
		return QADao.qmulDelBoard(dto);
	}

	@Override
	public QADto getDetailAjax(QADto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qgetCount() {
		return QADao.qgetCount();
	}

	@Override
	public List<QADto> qgetBoardList(int startNum, int endNum) {
		return QADao.qgetBoardList(startNum, endNum);

	}

}
