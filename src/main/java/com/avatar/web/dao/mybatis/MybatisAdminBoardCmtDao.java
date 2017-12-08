package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.AdminBoardCmtDao;
import com.avatar.web.entity.AdminBaordCmt;
import com.avatar.web.entity.BoardCmt;


public class MybatisAdminBoardCmtDao implements AdminBoardCmtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(BoardCmt cmt) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		int result = adminBoardCmtDao.insert(cmt);
		return result;
	}

	@Override
	public List<AdminBaordCmt> getList(String adminBoardId) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		List<AdminBaordCmt> list= adminBoardCmtDao.getList(adminBoardId);
		return list;
	}

	@Override
	public int deleteInformation(String no) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		return adminBoardCmtDao.deleteInformation(no);
	}

	@Override
	public AdminBaordCmt get(String no) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		AdminBaordCmt cmt = adminBoardCmtDao.get(no);
		return cmt;
	}

	@Override
	public int delete(String no) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		return adminBoardCmtDao.delete(no);
	}

	@Override
	public int update(BoardCmt boardCmt) {
		AdminBoardCmtDao adminBoardCmtDao = sqlSession.getMapper(AdminBoardCmtDao.class);
		return adminBoardCmtDao.update(boardCmt);
	}

}
