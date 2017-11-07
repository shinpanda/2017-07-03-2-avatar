package com.avatar.web.dao;

import com.avatar.web.entity.Member;

public interface MemberRoleDao {

	String get(String sessionId);

	int insert(String memberId,String role); 

}
