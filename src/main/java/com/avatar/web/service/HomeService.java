package com.avatar.web.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.InformationDao;
import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.dao.NoticeDao;
import com.avatar.web.dao.QuestionDao;
import com.avatar.web.dao.ScheduleDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;
import com.avatar.web.entity.Schedule;

public class HomeService {
	@Autowired
	private MemberRoleDao memberRoleDao;
	
	@Autowired
	private MemberClassDao memberClassDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private InformationDao informationDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	public String getRole(String id) {
		return memberRoleDao.getRole(id);
	}
	
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

	public  List<Schedule> getScheduleCheck(String date, String id) {
		
		 List<Schedule> list = scheduleDao.getScheduleCheck(date, getClassId(id));
		return list;
	}

	public int insertSchedule(String date, String subject, String content, String writerId) throws ParseException {
		Date dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		System.out.println(dateTime);
		int result = scheduleDao.insert(dateTime, subject, content, getClassId(writerId));
		return result;
	}

	public int deleteSchedule(String id) {
		int result = scheduleDao.delete(id);
		return result;
	}

}

