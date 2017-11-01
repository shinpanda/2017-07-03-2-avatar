package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ChatDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.ChatView;
import com.avatar.web.entity.Member;


public class MemberService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private MemberDao memberDao;

	public String getClassId(String id) {
		String classId = memberDao.getClassId(id);
		return classId;
	}

	public int insert(Member member) {
		memberDao.insert(member);
		return 0;
	}
	public List<ChatView> getChatList(String id){
		return chatDao.getList(getClassId(id));
	}
	
	
	public int insertChat(String content, String writerId) {
		String classId = getClassId(writerId);
		System.out.println(classId);
		
		return chatDao.insert(content, writerId, classId); 
	}

	
}
