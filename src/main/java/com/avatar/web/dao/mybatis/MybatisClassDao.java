package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ClassDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Class;

public class MybatisClassDao implements ClassDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Class> getList() {
		/*ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		List<Class> list = classDao.getList();*/
		
		return getList(1, "course", "");
	}
	
	@Override
	public List<Class> getList(Integer page, String field, String query) {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		List<Class> list = classDao.getList(page, field, query);
		return list;
	}

	@Override
	public int checkPw(String classId, String classPwd) {
		System.out.println("id,pwd:"+classId+", "+classPwd);
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		 System.out.println("classDao.checkPw return():"+classDao.checkPw(classId, classPwd));
		  
        return classDao.checkPw(classId, classPwd);
		
	}

	@Override
	public int getCount() {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.getCount();
	}

}
