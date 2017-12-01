package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ClassDao;
import com.avatar.web.dao.LectureRoomDao;
import com.avatar.web.entity.Class;
import com.avatar.web.entity.LectureRoom;

public class AdminService {

	@Autowired
	ClassDao classDao;
	
	@Autowired
	LectureRoomDao lectureRoomDao;
	
	public List<Class> getClassList(Integer page, String field, String query) {
		List<Class> list = classDao.getList(page, field, query);
		
		return list;
	}

	public int getClassCount() {
		int count = classDao.getCount();
		return count;
	}

	public int editLectureRoom(String id, int row, int col) {
		System.out.println("test "+id+" "+row+ " "+col);
		int result = lectureRoomDao.update(id, row, col);
		return result;
	}

	public int regLectureRoom(String id, int row, int col) {
		System.out.println("test "+id+" "+row+ " "+col);
		int result = lectureRoomDao.insert(id, row, col);
		return result;
	}

	public int delLectureRoom(String id) {
		int result = lectureRoomDao.delete(id);
		return result;
	}

	public List<LectureRoom> getLectureRoomList() {
		List<LectureRoom> list = lectureRoomDao.getList();
		
		return list;
	}

	public int getLectureRoomCount() {
		int count = lectureRoomDao.getCount();
		return count;
	}

}
