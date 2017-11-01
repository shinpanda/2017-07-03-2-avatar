package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.BoardView;

public interface QuestionDao {

	List<BoardView> getList(Integer page, String field, String query);

}
