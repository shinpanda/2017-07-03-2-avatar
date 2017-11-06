package com.avatar.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Member;

public class MybatisMemberDao implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public String getClassId(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		String classId = memberDao.getClassId(id);
		return classId;
	}
	
	@Override
	public int insert(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		MemberDao ClassDao = sqlSession.getMapper(MemberDao.class);
		
		int result = 0;
		result += memberDao.insert(member);
		/*result += memberDao.checkClass();*/
		return result;
	}
	

	@Override
	public int insert(String id, String pwd, String name, String email) {
		return insert(new Member(id, pwd, name, email));
	}


}
