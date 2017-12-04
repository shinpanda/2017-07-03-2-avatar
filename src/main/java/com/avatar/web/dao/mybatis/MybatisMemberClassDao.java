package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.avatar.web.dao.MemberClassDao;

import com.avatar.web.entity.MemberClassView;

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

	@Override
	public List<MemberClassView> getList(String classId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		List<MemberClassView> list = memberClassDao.getList(classId);

		return list;
	}
	
	@Override
	public List<MemberClassView> getMemberList(int page, String field, String query) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		System.out.println(page);
		System.out.println(field);
		System.out.println(query);
		return memberClassDao.getMemberList(page, field, query);
		
	}
	
	@Override
	public int getMemberCount() {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		return memberClassDao.getMemberCount();
	}

	@Override
	public MemberClassView getHeader(String sessionId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		MemberClassView mcv = memberClassDao.getHeader(sessionId);
		return mcv;
	}

	@Override
	public MemberClassView getClassInfo(String id) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		MemberClassView memberClassView = memberClassDao.getClassInfo(id);
		return memberClassView;
	}

	@Override
	public int getStuCount(String classId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		return memberClassDao.getStuCount(classId);
	}

	@Override
	public String getClassName(String classId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		return memberClassDao.getClassName(classId);
	}
	

}
