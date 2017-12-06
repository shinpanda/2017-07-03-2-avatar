package com.avatar.web.dao;

import com.avatar.web.entity.Member;

public interface MemberRoleDao {


	int insert(String memberId,String role); 

	String getRole(String sessionId);

	int update(String id, String role); 

}
