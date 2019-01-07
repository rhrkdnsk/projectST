package com.hk.trip.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.trip.dto.AboardDto;
import com.hk.trip.dto.CheckLikeDto;
import com.hk.trip.dto.CommentDto;

@Repository
public class AboardDao implements IAboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.hk.trip.aboard.";
	private String namespace1 = "com.hk.trip.comment.";
	private String namespace2 = "com.hk.trip.checklike.";
	@Override
	public List<AboardDto> getBoardList(int startNum, int endNum, String akeyWord, String akeyField,
			int areaboard_code) {
		Map<String, String> map = new HashMap<String, String>();	
		if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "" ) {
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("akeyField", akeyField);
			map.put("akeyWord", akeyWord);
			map.put("areaboard_code", areaboard_code+"");
			return sqlSession.selectList(namespace + "agetSearchlist", map);
		} else {
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("areaboard_code", areaboard_code+"");

		//System.out.println (sqlSession.selectList(namespace + "getNumlist", map));

		return sqlSession.selectList(namespace + "agetNumlist", map);
		
		
	}

	}
	
	@Override
	public int getCount(String akeyWord, String akeyField, int startNum, int endNum, int areaboard_code) {
		// TODO Auto-generated method stub
		if(akeyField != null && akeyWord != null && akeyField != "" && akeyWord != "" ) {
			System.out.println("Dao에서 if문 실행");
			System.out.println("Dao startNum : " + startNum + "endNum : " + endNum + "akeyField : " + akeyField + "akeyWord : " + akeyWord + "areaboard_code : " + areaboard_code);
			Map<String, String> map = new HashMap<String, String>();
			map.put("akeyWord", akeyWord);
			map.put("akeyField", akeyField);
//			map.put("startNum", startNum+"");
//			map.put("endNum", endNum+"");
			map.put("areaboard_code", areaboard_code+"");
			System.out.println(map);
			System.out.println("Dao getCount 실행결과 : " + sqlSession.selectOne(namespace + "agetSearchCount", map));
			int asd =  sqlSession.selectOne(namespace + "agetSearchCount", map);
			return asd;
		} else {
			System.out.println(sqlSession.selectOne(namespace + "agetCount",areaboard_code));
			return sqlSession.selectOne(namespace + "agetCount",areaboard_code);

		}	
		
	}
	@Override
	public boolean insertBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		System.out.println(dto);
		count = sqlSession.insert(namespace + "ainsertBoard", dto);
		
		return count > 0 ? true : false;
	}
	@Override
	public AboardDto getDetailview(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("areaboard_num", areaboard_num);
		map.put("areaboard_code", areaboard_code);
		System.out.println("map : " + map);
		return sqlSession.selectOne(namespace + "adetailview", map);
	}
	
	
	@Override
	public boolean updateBoard(AboardDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		System.out.println("updateBoard dto : " + dto);
		count = sqlSession.update(namespace + "updateaBoard" , dto);
		
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean deleteBoard(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		int count = 0;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("areaboard_num", areaboard_num);
		map.put("areaboard_code",areaboard_code);
		
		count = sqlSession.delete(namespace + "adeleteBoard",map);
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean insReply(CommentDto dto) {
		// TODO Auto-generated method stub
	int count = 0 ;
	count = sqlSession.insert(namespace + "insareply" , dto);
	
		
		return count > 0 ? true : false;
	}
	@Override
	public List<CommentDto> getReply(int areaboard_num) {
		// TODO Auto-generated method stub
				
		return sqlSession.selectList(namespace1 + "agetReply", areaboard_num);
	}
	@Override
	public AboardDto goBack(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("areaboard_num", areaboard_num);
		map.put("areaboard_code", areaboard_code);
		return sqlSession.selectOne(namespace + "agoBack" , map);
	}
	@Override
	public AboardDto goNext(int areaboard_num, int areaboard_code) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("areaboard_num", areaboard_num);
		map.put("areaboard_code", areaboard_code);
		
		return sqlSession.selectOne(namespace + "agoNext" , map);
	}
	@Override
	public boolean readCount(int areaboard_num) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.update(namespace + "areadCount",areaboard_num);
		return count > 0 ? true : false;
	}
	
	@Override
	public boolean deleteReply(CommentDto dto) {
		// TODO Auto-generated method stub
		int count = 0 ;
		count = sqlSession.delete(namespace1 + "adelComment", dto);
		return count > 0? true:false;
	}
	
	@Override
	public boolean checkLike(CheckLikeDto dto) {
		// TODO Auto-generated method stub	
		if(sqlSession.selectOne(namespace2 + "agetLike", dto) == null) {
			return false;
		} else {
			return true;
		}
	}
	@Override
	public boolean deleteCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		int count = 0 ;
		count = sqlSession.delete(namespace2 + "adelLike", dto);
		return count > 0 ? true : false;
	}
	@Override
	public boolean insertCheck(CheckLikeDto dto) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.insert(namespace2 + "ainsLike", dto);
		return count > 0 ? true : false;
	}
	@Override
	public void downLike(int areaboard_num) {
		sqlSession.update(namespace2 + "adownLike", areaboard_num);
	}
	@Override
	public void upLike(int areaboard_num) {
		sqlSession.update(namespace2 + "aupLike", areaboard_num);
	}
	@Override
	public int likeCount(int areaboard_num) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace2 + "alikeCount", areaboard_num);
	}
	@Override
	public boolean bcDelete(int areaboard_num) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.delete(namespace1 + "abcDelete", areaboard_num);
		return count >0? true:false;
	}
	
	
	} //끝
