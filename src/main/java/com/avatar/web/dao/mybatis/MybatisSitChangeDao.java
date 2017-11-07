package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.SitChangeDao;
import com.avatar.web.entity.Member;
import com.avatar.web.entity.SitChangeView;




public class MybatisSitChangeDao implements SitChangeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<SitChangeView> getList(String classId) {
		SitChangeDao sitChangeDao = sqlSession.getMapper(SitChangeDao.class);
		List<SitChangeView> list = sitChangeDao.getList(classId);

	return list;
	}


	@Override

	public String getClassId(String sessionId) {
		//System.out.println(sessionId);
		SitChangeDao sitChangeDao = sqlSession.getMapper(SitChangeDao.class);
		
		String classId = sitChangeDao.getClassId(sessionId);
		
		return classId;
	}

	public List<SitChangeView> getHeader(String sessionId) {
		SitChangeDao sitChangeDao = sqlSession.getMapper(SitChangeDao.class);
		List<SitChangeView> list = sitChangeDao.getHeader(sessionId);
		return list;

	}



		

}
