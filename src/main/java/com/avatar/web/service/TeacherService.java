package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.NoticeDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardCmt;
import com.avatar.web.entity.BoardView;

public class TeacherService {
	
	@Autowired
	MemberClassDao memberClassDao;
	
	@Autowired
	NoticeDao noticeDao;

	public List<Board> getNoticeList(Integer page, String field, String query, String id) {
		String classId = memberClassDao.getClassId(id);
		List<Board> list = null;
		
		if(field.indexOf("-") > 0) {
			String[] fields = field.split("-");
			list = noticeDao.getList(page, fields[0], fields[1], query, classId);
			int count = noticeDao.getCount("1");
		}
		else {
			list = noticeDao.getList(page, field, query, classId);
		}
		return list;
	}

	public int getNoticeCount(String id) {
		int count = noticeDao.getCount(memberClassDao.getClassId(id));
		//int count = noticeDao.getCount("1");
		return count;
	}

	public Board getNotice(String no) {
		int result = noticeDao.updateHit(no);
		Board b = noticeDao.get(no);
		return b;
	}
	

	public int insertNotice(Board board) {
		board.setClassId(memberClassDao.getClassId(board.getWriterId()));
		int result = noticeDao.insert(board);
		return result;
	}
	public int editNotice(Board board) {
		int result = noticeDao.update(board);
		return result; 
	}

	public int deleteNotice(String no) {
		int result = noticeDao.delete(no);
		return result; 
	}
	
}
