package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.SitChangeView;



public interface SitChangeDao {
	List<SitChangeView> getList(String classId);

	String getClassId(String sessionId);

	List<SitChangeView> getHeader(String sessionId);
	
}
