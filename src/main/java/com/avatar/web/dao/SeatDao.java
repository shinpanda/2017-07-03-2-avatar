package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.SeatView;



public interface SeatDao {
	List<SeatView> getList(String classId);

	String getClassId(String sessionId);

	List<SeatView> getHeader(String sessionId);
	
}
