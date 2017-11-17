package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.NoticeDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public class MybatisNoticeDao implements NoticeDao {

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
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getList(page, field, field2, query, classId);
	}
	
	@Override
	public int getCount(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getCount(id);
	}

	@Override
	public BoardView get(String no) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.get(no);
	}

	@Override
	public int insert(Board board) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.insert(board);
	}

	@Override
	public int updateHit(String no) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.updateHit(no);
	}

	@Override
	public int update(Board board) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.update(board);
	}

	@Override
	public int delete(String no) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.delete(no);
	}

}
