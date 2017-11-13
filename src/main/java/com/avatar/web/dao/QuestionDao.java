package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public interface QuestionDao {

	List<BoardView> getList(Integer page, String field, String query, String classId);
	List<BoardView> getList(Integer page, String field, String field2, String query, String classId);
	List<BoardView> getList(String classId);

	int getCount(String classId);
	
	BoardView get(String no);
	int insert(Board board);
	int updateHit(String no);

}
