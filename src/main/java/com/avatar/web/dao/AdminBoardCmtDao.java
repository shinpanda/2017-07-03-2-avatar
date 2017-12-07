package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.AdminBaordCmt;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardCmt;
import com.avatar.web.entity.BoardView;

public interface AdminBoardCmtDao {

	int insert(BoardCmt cmt);

	List<AdminBaordCmt> getList(String adminBoardId);

	int deleteInformation(String adminBoardId);

	AdminBaordCmt get(String adminBoardId);

	int delete(String adminBoardId);

	int update(BoardCmt boardCmt);

	

}
