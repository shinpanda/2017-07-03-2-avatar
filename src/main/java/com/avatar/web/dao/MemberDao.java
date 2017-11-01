package com.avatar.web.dao;

import com.avatar.web.entity.Member;

public interface MemberDao {

	String getClassId(String id);

	int insert(Member member);

	int insert(String id, String pwd, String name, String email);

}
