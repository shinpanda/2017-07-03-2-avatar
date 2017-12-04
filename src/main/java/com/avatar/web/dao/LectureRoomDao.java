package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.LectureRoom;

public interface LectureRoomDao {

	int update(String id, int row, int col);
	int update(LectureRoom room);

	int insert(String id, int row, int col);
	int insert(LectureRoom room);

	int delete(String id);
	List<LectureRoom> getList();
	int getCount();
	
	int getRow(String className);
	int getCol(String className);
}
