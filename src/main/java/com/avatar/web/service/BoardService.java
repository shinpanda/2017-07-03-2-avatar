package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public class BoardService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private QuestionDao questionDao;

	public List<BoardView> getQuestionList(Integer page, String field, String query, String id) {
		String classId = memberDao.getClassId(id);
		List<BoardView> list = null;
		
		if(field.indexOf("-") > 0) {
			String[] fields = field.split("-");
			list = questionDao.getList(page, fields[0], fields[1], query, classId);
		}
		else {
			list = questionDao.getList(page, field, query, classId);
		}
		return list;
	}

	public int getQuestionCount(String id) {
		int count = questionDao.getCount(id);
		return count;
	}

	public BoardView getQuestion(String no) {
		BoardView b = questionDao.get(no);
		int result = questionDao.updateHit(no);
		return b;
	}

	public int insertQuestion(Board board) {
		board.setClassId(memberDao.getClassId(board.getWriterId()));
		int result = questionDao.insert(board);
		return result;
	}
	
	
	

}