package com.avatar.web.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ChatDao;
import com.avatar.web.dao.MemberDao;

public class MemberService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private MemberDao memberDao;

	public String getClassId(String id) {
		String classId = memberDao.getClassId(id);
		return classId;
	}

	public int insertChat(String content, String writerId) {
		String classId = getClassId(writerId);
		System.out.println(classId);
		
		return chatDao.insert(content, writerId, classId); 
	}

}
