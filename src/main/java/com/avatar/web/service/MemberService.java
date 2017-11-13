package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.avatar.web.dao.ChatDao;
import com.avatar.web.dao.ClassDao;
import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.entity.ChatView;
import com.avatar.web.entity.Member;
import com.google.gson.JsonElement;


public class MemberService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberRoleDao memberRoleDao;
	@Autowired
	private MemberClassDao memberClassDao;
	@Autowired
	private ClassDao classDao;

	
	public String getClassId(String id) {
		String classId = memberClassDao.getClassId(id);
		return classId;
	}
	/*
	@Transactional
	public int insert(Member member, Class c){
		int result = 0;
		result = memberDao.insert(member);
		result = classDao.check(c);
		return result;
	}*/
	public List<ChatView> getChatList(String id){
		return chatDao.getList(getClassId(id));
	}
	
	
	public int insertChat(String content, String writerId) {
		String classId = getClassId(writerId);
		System.out.println(classId);
		
		return chatDao.insert(content, writerId, classId); 
	}
	@Transactional
	public int insert(Member member,String role) {
		int result = memberDao.insert(member);
		result = memberRoleDao.insert(member.getId(),role);
		return result;
	}
	@Transactional
	public int insert(Member member, String role, String classId) {
		int result = memberDao.insert(member);
		result = memberRoleDao.insert(member.getId(),role);
		result = memberClassDao.insert(member.getId(),classId);
		
		
		return result;
	}
	public int idCheck(String id) {
		int result = memberDao.idCheck(id);
		return result;
	}
	public int emailCheck(String email) {
	int result = memberDao.emailCheck(email);
		return result;
	}
	
}
