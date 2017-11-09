package com.avatar.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.entity.Member;

public class MybatisMemberRoleDao  implements MemberRoleDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public String getRole(String sessionId) {
		MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
		String role = memberRoleDao.getRole(sessionId);	
		//System.out.println(role+"rorororo");
		return role;
	}

	@Override
	public int insert(String memberId, String role) {
		MemberRoleDao memberRoleDao = sqlSession.getMapper(MemberRoleDao.class);
		return memberRoleDao.insert(memberId,role);
	}}
