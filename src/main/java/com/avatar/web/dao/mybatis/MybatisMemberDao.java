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
		return memberDao.insert(member);
	}

	@Override
	public int insert(String id, String pwd, String name, String email) {
		return insert(new Member(id, pwd, name, email));
	}

	@Override
	public int idCheck(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.idCheck(id);
		return result;
	}


	@Override
	public int emailCheck(String email) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.emailCheck(email);
		return result;
	}

	@Override
	public Member getProfile(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Member member = memberDao.getProfile(id);
		return member;
	}


	@Override
	public int update(String id,String name, String pwd, String email) {
		return update(new Member(id, pwd, name, email));
	}


	@Override
	public int update(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.update(member);
		return result;
	}

	@Override
	public int check(String id, String checkpwd) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.check(id,checkpwd);
	}

	@Override
	public void delete(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.delete(id);
	}

}
