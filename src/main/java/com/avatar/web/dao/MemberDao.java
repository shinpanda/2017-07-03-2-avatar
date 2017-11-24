package com.avatar.web.dao;

import com.avatar.web.entity.Member;

public interface MemberDao {

	int insert(Member member);

	int insert(String id, String pwd, String name, String email);

	int idCheck(String id);

	int emailCheck(String email);

	Member getProfile(String id);

	int update(String id, String name, String pwd, String email);

	int update(Member member);

	int check(String id, String checkpwd);

	void delete(String id);

}
