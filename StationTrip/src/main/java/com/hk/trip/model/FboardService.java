package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.CheckLikeDto;
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
	public int getCount(String keyWord, String keyField,int startNum,int endNum) {
		// TODO Auto-generated method stub
		return ifboarddao.getCount(keyWord,keyField,startNum,endNum);
	}
	@Override
	public List<FboardDto> getBoardList(int startNum,int endNum,String keyWord, String keyField) {
		// TODO Auto-generated method stub
		return ifboarddao.getBoardList(startNum,endNum,keyWord,keyField);
	}
	@Override
	public boolean delComment(CommentDto cdto) {
		// TODO Auto-generated method stub
		return ifboarddao.delComment(cdto);
	}
	@Override
	public boolean Commentreply(CommentDto dto) {
		// TODO Auto-generated method stub
		return ifboarddao.Commentreply(dto);
	}
	@Override
	public boolean bcDelete(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.bcDelete(freeboard_num);
	}
	@Override
	public boolean checkLike(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return ifboarddao.checkLike(dto);
	}
	@Override
	public boolean deleteCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return ifboarddao.deleteCheck(dto);
	}
	@Override
	public boolean insertCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return ifboarddao.insertCheck(dto);
	}
	@Override
	public int likeCount(int freeboard_num) {
		// TODO Auto-generated method stub
		return ifboarddao.likeCount(freeboard_num);
	}
	@Override
	public void downLike(int freeboard_num) {
		// TODO Auto-generated method stub
		ifboarddao.downLike(freeboard_num);
	}
	@Override
	public void upLike(int freeboard_num) {
		// TODO Auto-generated method stub
		ifboarddao.upLike(freeboard_num);
	}
	@Override
	public void deleteLike(int freeboard_num) {
		// TODO Auto-generated method stub
		ifboarddao.deleteLike(freeboard_num);
	}
	@Override
	public void upComment(int freeboard_num) {
		// TODO Auto-generated method stub
		ifboarddao.upComment(freeboard_num);
	}
	@Override
	public void downComment(int freeboard_num) {
		// TODO Auto-generated method stub
		ifboarddao.downComment(freeboard_num);
	}

	@Override
	public List<CommentDto> aReplyList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return ifboarddao.aReplyList(map);
	}
	@Override
	public void deleteStep(CommentDto cdto) {
		// TODO Auto-generated method stub
		ifboarddao.deleteStep(cdto);
	}

	@Override
	public void updateNickname(Map<String, String> map) {
		 ifboarddao.updateNickname(map);
	}
	@Override
	public void pointUp(String user_nickname) {
		// TODO Auto-generated method stub
		ifboarddao.pointUp(user_nickname);
	}
	@Override
	public void pointDown(String user_nickname) {
		// TODO Auto-generated method stub
		ifboarddao.pointDown(user_nickname);
	}
	@Override
	public void upGrade(String user_nickname) {
		// TODO Auto-generated method stub
		ifboarddao.upGrade(user_nickname);
	}
	@Override
	public void pointUp10(String user_nickname) {
		// TODO Auto-generated method stub
		ifboarddao.pointUp10(user_nickname);
	}
	@Override
	public void FCCount(CommentDto dto) {
		// TODO Auto-generated method stub
		ifboarddao.FCCount(dto);
	}
	@Override
	public void DCCount(CommentDto dto) {
		// TODO Auto-generated method stub
		ifboarddao.DCCount(dto);
	}
}
