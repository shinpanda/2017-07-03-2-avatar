package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.InformationCmtDao;
import com.avatar.web.dao.QuestionCmtDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.BoardCmt;


public class MybatisInformationCmtDao implements InformationCmtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(BoardCmt cmt) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		int result = informationCmtDao.insert(cmt);
		return result;
	}

	@Override
	public List<BoardCmt> getList(String no) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		List<BoardCmt> list= informationCmtDao.getList(no);
		return list;
	}

	@Override
	public int deleteInformation(String no) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		return informationCmtDao.deleteInformation(no);
	}

	@Override
	public BoardCmt get(String no) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		BoardCmt cmt = informationCmtDao.get(no);
		return cmt;
	}

	@Override
	public int delete(String no) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		return informationCmtDao.delete(no);
	}

	@Override
	public int update(BoardCmt boardCmt) {
		InformationCmtDao informationCmtDao = sqlSession.getMapper(InformationCmtDao.class);
		return informationCmtDao.update(boardCmt);
	}

}
