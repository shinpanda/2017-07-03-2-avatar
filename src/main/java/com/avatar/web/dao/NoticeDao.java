package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public interface NoticeDao {

	List<Board> getList(Integer page, String field, String query, String classId);
	List<Board> getList(Integer page, String field, String field2, String query, String classId);
	List<Board> getList(String classId);

	int getCount(String classId);
	
	Board get(String no);
	int insert(Board board);
	int updateHit(String no);
	int update(Board board);
	int delete(String no);

}
