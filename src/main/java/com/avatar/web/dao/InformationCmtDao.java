package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.BoardCmt;

public interface InformationCmtDao {

	int insert(BoardCmt cmt);

	List<BoardCmt> getList(String no);

	int deleteInformation(String no);

	BoardCmt get(String no);

	int delete(String no);

	int update(BoardCmt boardCmt);

}
