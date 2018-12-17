package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

@Service
public class FboardService implements IFboardService {

	@Autowired
	private IFboardDao ifboarddao;
	
	@Override
	public List<FboardDto> getAllList(String keyWord, String keyField)	 {
		return ifboarddao.getAllList(keyWord,keyField);
	}
	
	@Override
	public boolean insertBoard(FboardDto fdto) {
		return ifboarddao.insertBoard(fdto);
	}
	@Override
	public FboardDto getDetailView(int freeboard_num) {
		return ifboarddao.getDetailView(freeboard_num);
	}
	
	@Override
	public List<CommentDto> getReply(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.getReply(freeboard_num);
	}
	@Override
	public boolean upDateBoard(FboardDto fdto) {
		// TODO Auto-generated method stub
		return ifboarddao.updateBoard(fdto);
	}
	@Override
	public boolean deleteBoard(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.deleteBoard(freeboard_num);
	}
	@Override
	public boolean replyInsert(CommentDto cdto) {
		// TODO Auto-generated method stub
		return ifboarddao.replyInsert(cdto);
	}
	@Override
	public FboardDto goNext(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.goNext(freeboard_num);
	}
	@Override
	public FboardDto goBack(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.goBack(freeboard_num);
	}
	@Override
	public boolean readCount(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.readCount(freeboard_num);
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return ifboarddao.getCount();
	}
	@Override
	public List<FboardDto> getBoardList(int startNum,int endNum) {
		// TODO Auto-generated method stub
		return ifboarddao.getBoardList(startNum,endNum);
	}
}
