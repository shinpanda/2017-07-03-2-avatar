package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.BoardCmt;

public interface QuestionCmtDao {

	int insert(BoardCmt cmt);

	List<BoardCmt> getList(String no);

}
