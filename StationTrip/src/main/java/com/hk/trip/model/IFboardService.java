package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

public interface IFboardService {

	
	
	public List<FboardDto> getAllList(String keyWord, String keyField);
	public boolean insertBoard(FboardDto fdto);
	public FboardDto getDetailView(int freeboard_num);
	public List<CommentDto> getReply(int freeboard_num);
	public boolean upDateBoard(FboardDto fdto);
	public boolean deleteBoard(int freeboard_num);
	public boolean replyInsert(CommentDto cdto);
	public FboardDto goNext(int freeboard_num);
	public FboardDto goBack(int freeboard_num);
	public boolean readCount(int freeboard_num);
	public int getCount(String keyWord, String keyField,int startNum,int endNum);
	public List<FboardDto> getBoardList(int startNum,int endNum,String keyWord, String keyField);
	public boolean delComment(CommentDto cdto);
	public boolean Commentreply(CommentDto dto);
	public boolean bcDelete(int freeboard_num);
	public boolean checkLike(CheckLikeDto dto);
	public boolean insertCheck(CheckLikeDto dto);
	public boolean deleteCheck(CheckLikeDto dto);
	public int likeCount(int freeboard_num);
	public void downLike(int freeboard_num);
	public void upLike(int freeboard_num);
	public void deleteLike(int freeboard_num);
	public void upComment(int freeboard_num);
	public void downComment(int freeboard_num);
	public List<CommentDto> aReplyList(Map<String,Integer>map);
	public void deleteStep(CommentDto cdto);
	public void updateNickname(Map<String, String> map);
	public void pointUp(String user_nickname);
	public void pointDown(String user_nickname);
	public void upGrade(String user_nickname);
	public void pointUp10(String user_nickname);
	public void FCCount(CommentDto dto);
	public void DCCount(CommentDto dto);

}
