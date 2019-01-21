package com.hk.trip.model;

import java.util.List;
import java.util.Map;

import com.hk.trip.dto.AboardDto;
import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;

public interface IAboardDao {

	
	public List<AboardDto> getBoardList(int startNum,int endNum,String akeyWord, String akeyField,int areaboard_code);
	public int getCount(String keyWord, String keyField,int startNum,int endNum,int areaboard_code);
	public boolean insertBoard(AboardDto dto);
	public AboardDto getDetailview(int areaboard_num,int areaboard_code);
	public boolean updateBoard(AboardDto dto);
	public boolean deleteBoard(int areaboard_num, int areaboard_code);
	public boolean insReply(CommentDto dto);
	public List<CommentDto> getReply(int areaboard_num);
	public List<CommentDto> aReplyList(Map<String,Integer>map);
	public AboardDto goBack(int areaboard_num, int areaboard_code);
	public AboardDto goNext(int areaboard_num, int areaboard_code);
	public boolean readCount (int areaboard_num);
	public boolean deleteReply(CommentDto dto);
	public boolean checkLike(CheckLikeDto dto);
	public boolean insertCheck(CheckLikeDto dto);
	public boolean deleteCheck(CheckLikeDto dto);
	public void downLike(int areaboard_num);
	public void upLike(int areaboard_num);
	public int likeCount(int areaboard_num);
	public boolean bcDelete(int areaboard_num);
	public void delLike(int areaboard_num);
	public void upComment(int areaboard_num);
	public void downComment(int areaboard_num);
	public boolean Commentreply(CommentDto dto);
	public void AupdateNickname(Map<String, String> map);
	public void CupdateNickname(Map<String, String> map);
	public void CCount(CommentDto dto);
	public void DCount(CommentDto dto);
}
