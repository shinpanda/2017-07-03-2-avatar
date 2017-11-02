package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public class MybatisQuestionDao implements QuestionDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardView> getList(Integer page, String field, String query, String classId) {
		/*QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.getList(page, field, query);*/
		System.out.println(classId);
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.getList(page, field,"content", query, classId);
	}

	@Override
	public List<BoardView> getList(Integer page, String field, String field2, String query, String classId) {
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.getList(page, field, field2, query, classId);
	}
	
	@Override
	public int getCount(String id) {
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.getCount(id);
	}

	@Override
	public BoardView get(String no) {
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.get(no);
	}

	@Override
	public int insert(Board board) {
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.insert(board);
	}

	@Override
	public int updateHit(String no) {
		QuestionDao questionDao = sqlSession.getMapper(QuestionDao.class);
		return questionDao.updateHit(no);
	}


}
