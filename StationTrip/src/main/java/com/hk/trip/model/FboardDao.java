package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

@Repository
public class FboardDao implements IFboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.fboard.";
	private String namespace1 = "com.hk.trip.comment.";
	private String namespace2 = "com.hk.trip.checklike.";
	
	@Override
	public List<FboardDto> getAllList(String keyWord, String keyField)	{
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "" ) {
			Map<String,String> map = new HashMap<String,String>();
			map.put("keyField", keyField);
			map.put("keyWord",keyWord);
			return sqlSession.selectList(namespace + "boardSearch", map );
		} else {
		
		return sqlSession.selectList(namespace + "getAllContent" );
	}
	}
	
	@Override
	public boolean insertBoard(FboardDto fdto) {
		int count = 0;
		
		count = sqlSession.insert(namespace + "insertBoard" , fdto);
		return count > 0? true:false;
	}
	public int getLastNum() {
		int lastNum=0;
		sqlSession.selectList(namespace, "getLastNum");
		
		return lastNum;
	}
	
	@Override
	public FboardDto getDetailView(int freeboard_num) {
		
		return sqlSession.selectOne(namespace + "getDetailView", freeboard_num);
	}
	
	@Override
	public List<CommentDto> getReply(int freeboard_num) {
		return sqlSession.selectList(namespace1 + "getReply", freeboard_num);
	}
	@Override
	public boolean updateBoard(FboardDto fdto) {
		int count=0;
		count = sqlSession.update(namespace + "updateBoard", fdto);
		return count > 0? true : false;
	}
	
	@Override
	public boolean deleteBoard(int freeboard_num) {
		int count=0;
		count = sqlSession.update(namespace + "deleteBoard", freeboard_num);
		return count > 0? true : false;
	}
	
	@Override
	public boolean replyInsert(CommentDto cdto) {
		int count=0;
		count = sqlSession.insert(namespace1 + "writeReply" , cdto);
		
		
		return count > 0? true : false;
	}
	@Override
	public FboardDto goNext(int freeboard_num) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "goNext" , freeboard_num);
	}
	@Override
	public FboardDto goBack(int freeboard_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "goBack" , freeboard_num);
	}
	@Override
	public boolean readCount(int freeboard_num) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.update(namespace + "readCount", freeboard_num);
		return count > 0 ? true:false;
	}
	
	@Override
	public int getCount(String keyWord, String keyField,int startNum,int endNum) {
		// TODO Auto-generated method stub
		
		System.out.println("Dao에서 startnum : " + startNum  + "endNum : " +  endNum + "keyWord : " + keyWord  + "keyField : " + keyField);

		if(keyField != null && keyWord != null && keyField != "" && keyWord != "" ) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			
			int asd =  sqlSession.selectOne(namespace + "getSearchCount", map);
			//System.out.println(asd);
			return asd;
		} else {
			return sqlSession.selectOne(namespace + "getCount");

		}
		//System.out.println("getCount 값 :" + sqlSession.selectOne(namespace + "getCount"));
		
	}
	@Override
	public List<FboardDto> getBoardList(int startNum,int endNum,String keyWord, String keyField) {
		// TODO Auto-generated method stub
		//System.out.println("보드 갯수 목록 " + sqlSession.selectList(namespace + "getNumlist"));
		
		Map<String, String> map = new HashMap<String, String>();	
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "" ) {
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			return sqlSession.selectList(namespace + "getSearch", map);
		} else {
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		//System.out.println (sqlSession.selectList(namespace + "getNumlist", map));

		return sqlSession.selectList(namespace + "getNumlist", map);
		}
	}
	@Override
	public boolean delComment(CommentDto cdto) {
		// TODO Auto-generated method stub
		int count =0;
		count=sqlSession.delete(namespace1 + "delComment", cdto); 
		
		return count > 0 ? true:false;
	}
	
	@Override
	public boolean Commentreply(CommentDto dto) {
		// TODO Auto-generated method stub
		int count=0;
		System.out.println("대댓글 들어가는 값 : " + dto);
		count = sqlSession.insert(namespace1 + "insComment", dto);
		return count > 0? true:false;
	}
	
	@Override
	public boolean bcDelete(int freeboard_num) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.delete(namespace1 + "bcDelete", freeboard_num);
		
		return count > 0 ? true:false;
	}
	
	
	@Override
	public boolean checkLike(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		
		if(sqlSession.selectOne(namespace2 + "getLike", dto) == null) {
			return false;
		} else {
			return true;
		}
		
		
	}
	@Override
	public boolean deleteCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.delete(namespace2 + "delLike", dto);
		
		return count > 0 ? true: false;
		
	}
	
	@Override
	public boolean insertCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.insert(namespace2 + "insLike" , dto);
		return count > 0 ? true : false;
	}
	@Override
	public int likeCount(int freeboard_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace2 + "likeCount", freeboard_num);
	}
	@Override
	public void downLike(int freeboard_num) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace2 + "downLike" , freeboard_num);
	}
	@Override
	public void upLike(int freeboard_num) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace2 + "upLike" , freeboard_num);
	}
	@Override
	public void deleteLike(int freeboard_num) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace2 + "deleteLike" , freeboard_num); 
	}
	@Override
	public void upComment(int freeboard_num) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace1 + "upComment", freeboard_num);
	}
	@Override
	public void downComment(int freeboard_num) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace1 + "downComment", freeboard_num);

	}

	@Override
	public List<CommentDto> aReplyList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace1 + "fReplyList",map);
	}
	@Override
	public void deleteStep(CommentDto cdto) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace1 + "andCommentdel" , cdto);
	}

	@Override
	public void updateNickname(Map<String, String> map) {
		System.out.println(map.get("user_nickname"));
		System.out.println(map.get("ori_nickname"));
		sqlSession.update(namespace+"updateNickname", map);
	}
}
