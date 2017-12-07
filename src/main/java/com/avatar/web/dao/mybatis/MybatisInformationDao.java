package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.InformationDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public class MybatisInformationDao implements InformationDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardView> getList(String classId) {
		// TODO Auto-generated method stub
		return getList(1, "title","content", "", classId);
	}

	@Override
	public List<BoardView> getList(Integer page, String field, String query, String classId) {
		return getList(page, field,"content", query, classId);
	}

	@Override
	public List<BoardView> getList(Integer page, String field, String field2, String query, String classId) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		System.out.println("mybatis : "+classId);
		return informationDao.getList(page, field, field2, query, classId);
	}
	
	@Override
	public int getCount(String id) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.getCount(id);
	}

	@Override
	public BoardView get(String no) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.get(no);
	}

	@Override
	public int insert(Board board) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.insert(board);
	}

	@Override
	public int updateHit(String no) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.updateHit(no);
	}

	@Override
	public int update(Board board) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.update(board);
	}

	@Override
	public int delete(String no) {
		InformationDao informationDao = sqlSession.getMapper(InformationDao.class);
		return informationDao.delete(no);
	}


}
