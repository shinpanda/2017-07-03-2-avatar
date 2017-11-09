package com.avatar.web.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberClassDao;


public class MybatisMemberClassDao  implements MemberClassDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(String memberId, String classId) {
		MemberClassDao memberClassDao = sqlSession.getMapper(MemberClassDao.class);
		return memberClassDao.insert(memberId,classId);
	}
	
	
	}
