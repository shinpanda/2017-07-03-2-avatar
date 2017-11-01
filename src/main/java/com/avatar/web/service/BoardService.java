package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.BoardView;

public class BoardService {
	
	@Autowired
	private QuestionDao questionDao;

	public List<BoardView> getQuestionList(Integer page, String field, String query) {
		List<BoardView> list = questionDao.getList(page, field, query);
		return list;
	}

	public int getQuestionCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}

