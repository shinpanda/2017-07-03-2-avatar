package com.avatar.web.service;

import com.avatar.web.dao.ChatDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Member;

public class MemberService {
	
	private ChatDao chatDao;
	private MemberDao memberDao;

	public String getClassName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int insertChat(String classId) {
		return 0;
	}

	public int insert(Member member) {
		return memberDao.insert(member);
	}
	
	
	
	
}
