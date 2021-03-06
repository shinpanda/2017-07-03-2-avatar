package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.QuestionCmtDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.BoardCmt;


public class MybatisQuestionCmtDao implements QuestionCmtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(BoardCmt cmt) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		int result = questionCmtDao.insert(cmt);
		return result;
	}

	@Override
	public List<BoardCmt> getList(String no) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		List<BoardCmt> list= questionCmtDao.getList(no);
		return list;
	}

	@Override
	public int deleteQuestion(String no) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		return questionCmtDao.deleteQuestion(no);
	}

	@Override
	public BoardCmt get(String no) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		BoardCmt cmt = questionCmtDao.get(no);
		return cmt;
	}

	@Override
	public int delete(String no) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		return questionCmtDao.delete(no);
	}

	@Override
	public int update(BoardCmt boardCmt) {
		QuestionCmtDao questionCmtDao = sqlSession.getMapper(QuestionCmtDao.class);
		return questionCmtDao.update(boardCmt);
	}

}
