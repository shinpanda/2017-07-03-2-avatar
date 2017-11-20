package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.InformationDao;
import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.NoticeDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;

public class HomeService {
	@Autowired
	private MemberClassDao memberClassDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private InformationDao informationDao;
	
	public String getClassId(String id) {
		return memberClassDao.getClassId(id);
	}

	public List<BoardView> getQuestionList(String classId) {
		return questionDao.getList(classId);
	}

	public List<Board> getNoticeList(String classId) {
		// TODO Auto-generated method stub
		return noticeDao.getList(classId);
	}

	public List<BoardView> getInfomationList(String classId) {
		return informationDao.getList(classId);
	}

}
