package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.dao.QuestionCmtDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardCmt;
import com.avatar.web.entity.BoardView;

public class BoardService {
	@Autowired
	private MemberClassDao memberClassDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private QuestionCmtDao questionCmtDao;

	public List<BoardView> getQuestionList(Integer page, String field, String query, String id) {
		String classId = memberClassDao.getClassId(id);
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
		int count = questionDao.getCount(memberClassDao.getClassId(id));
		return count;
	}

	public BoardView getQuestion(String no) {
		BoardView b = questionDao.get(no);
		int result = questionDao.updateHit(no);
		return b;
	}
	
	public List<BoardCmt> getQuestionCmt(String no) {
		List<BoardCmt> list = questionCmtDao.getList(no);
		return list;
	}

	public int insertQuestion(Board board) {
		board.setClassId(memberClassDao.getClassId(board.getWriterId()));
		int result = questionDao.insert(board);
		return result;
	}
	public int editQuestion(Board board) {
		int result = questionDao.update(board);
		return result; 
	}

	public int insertQuestionCmt(BoardCmt cmt) {
		int result = questionCmtDao.insert(cmt);
		return result; 
	}

	public int deleteQuestion(String no) {
		int result = questionCmtDao.deleteQuestion(no);
		result += questionDao.delete(no);
		return result; 
	}

	
	
	

}