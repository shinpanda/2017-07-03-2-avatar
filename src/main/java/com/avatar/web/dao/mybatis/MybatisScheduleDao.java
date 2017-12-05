package com.avatar.web.dao.mybatis;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.avatar.web.dao.ScheduleDao;
import com.avatar.web.entity.Schedule;

public class MybatisScheduleDao implements ScheduleDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Schedule> getScheduleCheck(String date, String classId) {
		ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		List<Schedule> list = scheduleDao.getScheduleCheck(date, classId);
		return list;
	}

	@Override
	public int insert(Date dateTime, String subject, String content, String classId) {
		
		return insert(new Schedule(dateTime, subject, content, classId));
	}

	@Override
	public int insert(Schedule schedule) {
		ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		return scheduleDao.insert(schedule);
	}


}
