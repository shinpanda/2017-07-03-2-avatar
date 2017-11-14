package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.InformationCmtDao;
import com.avatar.web.dao.InformationDao;
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
	
	@Autowired
	private InformationDao informationDao;
	
	@Autowired
	private InformationCmtDao informationCmtDao;

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
		int result = questionDao.updateHit(no);
		BoardView b = questionDao.get(no);
		return b;
	}
	
	public List<BoardCmt> getQuestionCmtList(String no) {
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

	public BoardCmt getQuestionCmt(String no) {
		BoardCmt cmt = questionCmtDao.get(no);
		return cmt;
	}

	public int deleteQuestionCmt(String no) {
		int result = questionCmtDao.delete(no);
		return result;
	}

	public int editQuestionCmt(BoardCmt boardCmt) {
		int result = questionCmtDao.update(boardCmt);
		return result; 
	}
	
	// 정보공유

	public List<BoardView> getInformationList(Integer page, String field, String query, String id) {
		String classId = memberClassDao.getClassId(id);
		List<BoardView> list = null;
		System.out.println("service : "+classId);
		if(field.indexOf("-") > 0) {
			String[] fields = field.split("-");
			list = informationDao.getList(page, fields[0], fields[1], query, classId);
		}
		else {
			list = informationDao.getList(page, field, query, classId);
		}
		return list;
	}

	public int getInformationCount(String id) {
		int count = informationDao.getCount(memberClassDao.getClassId(id));
		return count;
	}

	public BoardView getInformation(String no) {
		int result = informationDao.updateHit(no);
		System.out.println("information hit result: "+result);
		BoardView b = informationDao.get(no);
		return b;
	}
	
	public List<BoardCmt> getInformationCmtList(String no) {
		List<BoardCmt> list = informationCmtDao.getList(no);
		return list;
	}
	
	public BoardCmt getInformationCmt(String no) {
		BoardCmt cmt = informationCmtDao.get(no);
		return cmt;
	}
	
	public int insertInformation(Board board) {
		board.setClassId(memberClassDao.getClassId(board.getWriterId()));
		int result = informationDao.insert(board);
		return result;
	}
	
	public int insertInformationCmt(BoardCmt cmt) {
		int result = informationCmtDao.insert(cmt);
		return result; 
	}

	public int editInformation(Board board) {
		int result = informationDao.update(board);
		return result; 
	}

	public int editInformationCmt(BoardCmt boardCmt) {
		int result = informationCmtDao.update(boardCmt);
		return result;
	}

	public int deleteInformation(String no) {
		int result = informationCmtDao.deleteInformation(no);
		result += informationDao.delete(no);
		return result;
		
	}

	public int deleteInformationCmt(String no) {
		int result = informationCmtDao.delete(no);
		return result;
	}

	
	


}