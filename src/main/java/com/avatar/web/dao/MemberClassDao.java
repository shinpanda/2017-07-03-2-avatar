package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.MemberClassView;

public interface MemberClassDao {
	int insert(String memberId, String classId);

	String getClassId(String id);
	
	List<MemberClassView> getList(String classId);
	List<MemberClassView> getMemberList(int page, String field, String query);
	
	int getMemberCount();
	
	MemberClassView getHeader(String sessionId);

	MemberClassView getClassInfo(String id);

	int getStuCount(String classId);

}
