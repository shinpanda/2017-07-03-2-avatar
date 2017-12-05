package com.avatar.web.dao;

import java.util.Date;
import java.util.List;

import com.avatar.web.entity.Schedule;

public interface ScheduleDao {

	 List<Schedule> getScheduleCheck(String date, String classId);

	int insert(Schedule schedule);

	int insert(Date dateTime, String subject, String content, String classId);

	int delete(String id);

}
