package com.avatar.web.dao;

public interface MemberClassDao {
	int insert(String memberId, String classId);

	String getClassId(String id);
}
