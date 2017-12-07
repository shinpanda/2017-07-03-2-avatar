package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.AdminDao;
import com.avatar.web.entity.AdminBoardView;
import com.avatar.web.entity.Board;


public class MybatisAdminDao implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AdminBoardView> getList() {
		// TODO Auto-generated method stub
		
		return getList(1, "title","content", "");
	}

	@Override
	public List<AdminBoardView> getList(Integer page, String field, String query) {
		return getList(page, field,"content", query);
	}

	@Override
	public List<AdminBoardView> getList(Integer page, String field, String field2, String query) {
		AdminDao noticeDao = sqlSession.getMapper(AdminDao.class);
		return noticeDao.getList(page, field, field2, query);
	}
	
	@Override
	public int getCount() {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.getCount();
	}

	@Override
	public AdminBoardView get(String adminBoardId) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		System.out.println(adminBoardId);
		return adminDao.get(adminBoardId);
	}

	@Override
	public int insert(Board board) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.insert(board);
	}

	@Override
	public int updateHit(String no) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.updateHit(no);
	}

	@Override
	public int update(Board board) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.update(board);
	}

	@Override
	public int delete(String no) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		return adminDao.delete(no);
	}

}
