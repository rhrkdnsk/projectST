package com.hk.trip.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.trip.dto.AboardDto;
import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;

@Service
public class AboardService implements IAboardService {

	@Autowired
	private IAboardDao iaboarddao;
	
@Override
	public List<AboardDto> getBoardList(int startNum, int endNum, String akeyWord, String akeyField,
			int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getBoardList(startNum, endNum, akeyWord, akeyField, areaboard_code);
	}	

	@Override
	public int getCount(String akeyWord, String akeyField, int startNum, int endNum, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getCount(akeyWord, akeyField, startNum, endNum, areaboard_code);
	}
	@Override
	public boolean insertBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.insertBoard(dto);
	}
	@Override
	public AboardDto getDetailview(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.getDetailview(areaboard_num, areaboard_code);
	}
	@Override
	public boolean updateBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.updateBoard(dto);
	}
	@Override
	public boolean deleteBoard(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.deleteBoard(areaboard_num, areaboard_code);
	}
	@Override
	public boolean insReply(CommentDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.insReply(dto);
	}
	@Override
	public List<CommentDto> getReply(int areaboard_num) {
		// TODO Auto-generated method stub
		return iaboarddao.getReply(areaboard_num);
	}
	@Override
	public AboardDto goBack(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.goBack(areaboard_num, areaboard_code);
	}
	@Override
	public AboardDto goNext(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		return iaboarddao.goNext(areaboard_num, areaboard_code);
	}
	@Override
	public boolean readCount(int areaboard_num) {
		// TODO Auto-generated method stub
		return iaboarddao.readCount(areaboard_num);
	}
	@Override
	public boolean deleteReply(CommentDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.deleteReply(dto);
	}
	@Override
	public boolean checkLike(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.checkLike(dto);
	}
	@Override
	public boolean deleteCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.deleteCheck(dto);
	}
	@Override
	public boolean insertCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		return iaboarddao.insertCheck(dto);
	}
	@Override
	public void downLike(int areaboard_num) {
		iaboarddao.downLike(areaboard_num);
	}
	@Override
	public void upLike(int areaboard_num) {
		// TODO Auto-generated method stub
		iaboarddao.upLike(areaboard_num);
	}
	@Override
	public int likeCount(int areaboard_num) {
		return iaboarddao.likeCount(areaboard_num);
	}
	@Override
	public boolean bcDelete(int areaboard_num) {
		// TODO Auto-generated method stub
		return iaboarddao.bcDelete(areaboard_num);
	}
	@Override
	public void delLike(int areaboard_num) {
		// TODO Auto-generated method stub
		iaboarddao.delLike(areaboard_num);
	}
	@Override
	public void upComment(int areaboard_num) {
		// TODO Auto-generated method stub
		iaboarddao.upComment(areaboard_num);
	}
	@Override
	public void downComment(int areaboard_num) {
		// TODO Auto-generated method stub
		iaboarddao.downComment(areaboard_num);
	}
}
