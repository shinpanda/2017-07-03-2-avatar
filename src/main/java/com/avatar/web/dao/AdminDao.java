package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.AdminBoardView;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public interface AdminDao {

	List<AdminBoardView> getList(Integer page, String field, String query);
	List<AdminBoardView> getList(Integer page, String field, String field2, String query);
	List<AdminBoardView> getList();

	int getCount();
	
	AdminBoardView get(String adminBoardId);
	int insert(Board board);
	int updateHit(String AdminBoardId);
	int update(Board board);
	int delete(String AdminBoardId);



}
