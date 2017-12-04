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
	public List<Class> getClassList(String id) {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		List<Class> list = classDao.getClassList(id);
		return list;
	}

	@Override
	public int getCount() {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.getCount();
	}

	@Override
	public int newClass(Class cl) {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.newClass(cl);
	}

	@Override
	public Class getClass(String openerId, String classId) {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.getClass(openerId,classId);
	}

	@Override
	public int editClass(Class cl) {
		/*System.out.println("mybatis:"+cl.getId()+", "+cl.getOpenerId()+", "+cl.getCourse());*/
		
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.editClass(cl);
	}

	@Override
	public int deleteClass(String openerId, String classId) {
		ClassDao classDao = sqlSession.getMapper(ClassDao.class);
		return classDao.deleteClass(openerId,classId);
	}

}
