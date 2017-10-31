package com.avatar.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberDao;

public class MybatisMemberDao implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public String getClassId(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		String classId = memberDao.getClassId(id);
		return classId;
	}

}
