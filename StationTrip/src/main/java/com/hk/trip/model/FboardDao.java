package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.CommentDto;
import com.hk.trip.dto.FboardDto;

@Repository
public class FboardDao implements IFboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.fboard.";
	private String namespace1 = "com.hk.trip.comment.";

	
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
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "" ) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			return sqlSession.selectOne(namespace + "getSearchCount", map); 
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
			System.out.println("startnum" + startNum + "endNum" + endNum + "keyWord" + keyWord + "keyField" + keyField);
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyWord", keyWord);
			map.put("keyField", keyField);
			return sqlSession.selectList(namespace + "getSearch", map);
		} else {
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		return sqlSession.selectList(namespace + "getNumlist", map);
		}
	}
		
}
