package com.avatar.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberDao;

public class MybatisMemberClassDao implements MemberClassDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(String memberId, String classId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		return memberClassDao.insert(memberId, classId);
	}
	
	@Override
	public String getClassId(String id) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		String classId = memberClassDao.getClassId(id);
		return classId;
	}
	

}
