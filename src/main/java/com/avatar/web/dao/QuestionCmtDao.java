package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.BoardCmt;

public interface QuestionCmtDao {

	int insert(BoardCmt cmt);

	List<BoardCmt> getList(String no);

	int deleteQuestion(String no);

	BoardCmt get(String no);

	int delete(String no);

	int update(BoardCmt boardCmt);

}
