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
import com.avatar.web.entity.MemberClassView;
import com.google.gson.JsonElement;
import com.avatar.web.entity.Class;


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
	public MemberClassView getClassInfo(String id) {
		MemberClassView memberClassView = memberClassDao.getClassInfo(id);
		String memberClass = memberClassView.getClassName();
		String memberRole = memberClassView.getMemberRole();
		System.out.println("className,memberRole : "+memberClass+","+memberRole);
		return memberClassView;
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
	
	public Member getProfile(String id) {
		Member member = memberDao.getProfile(id);
		return member;
	}
	
	public int update(String id, String name, String pwd, String email) {
		int result = memberDao.update(id,name,pwd,email);
		return result;
	}
	public int check(String id, String checkpwd) {
		int result = memberDao.check(id,checkpwd);
		return result;
	}
	public void delete(String id) {
		memberDao.delete(id);
	}
	public List<Class> getClassList(String id) {
		
		return classDao.getClassList(id);
	}
	public int newClass(Class cl) {
		int result = classDao.newClass(cl);
		
		return result;
	}
	public Class getClass(String openerId, String classId) {
		Class cl = classDao.getClass(openerId,classId);
		return cl;
	}

	public int editClass(Class cl) {
		int result = classDao.editClass(cl);

		return result;
	}
	public int getStuCount(String classId) {
		int result = memberClassDao.getStuCount(classId);

		return result;
	}
	public int deleteClass(String openerId, String classId) {
		int result = classDao.deleteClass(openerId,classId);
		return result;
	}
	public int updateDefaultClass(String openerId, String classId) {
		int result = memberClassDao.updateDefaultClass(openerId,classId);
		return result;
	}
	public int getDefaultClass(String openerId) {
		int result = memberClassDao.getDefaultClass(openerId);
		return result;
	}

}
