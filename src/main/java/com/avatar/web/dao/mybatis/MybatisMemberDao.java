package com.avatar.web.dao.mybatis;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Member;

public class MybatisMemberDao implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		System.out.println("id: "+member.getId());
		System.out.println("email"+member.getEmail());
		
		return memberDao.insert(member);
	}
	

	@Override
	public int insert(String id, String pwd, String name, String email) {
		return insert(new Member(id, pwd, name, email));
	}
		

}
