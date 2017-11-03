package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ClassDao;

public class MybatisClassDao implements ClassDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Class> getList() {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		List<Class> list = classDao.getList();
		
		return list;
	}

}
