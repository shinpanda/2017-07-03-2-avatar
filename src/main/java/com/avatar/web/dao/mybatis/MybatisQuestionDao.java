package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.BoardView;

public class MybatisQuestionDao implements QuestionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardView> getList(Integer page, String field, String query) {
		System.out.println("mybatis");
		System.out.println("page "+ page+"field "+field+"query "+query);
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.getList(page, field, query);
	}

}
