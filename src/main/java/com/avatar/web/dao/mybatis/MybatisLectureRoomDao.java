package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.LectureRoomDao;
import com.avatar.web.entity.LectureRoom;

public class MybatisLectureRoomDao implements LectureRoomDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int update(String id, int row, int col) {
		return update(new LectureRoom(id, row, col));
	}

	@Override
	public int update(LectureRoom room) {
		LectureRoomDao lectureRoomDao = sqlSession.getMapper(LectureRoomDao.class);
		int result = lectureRoomDao.update(room);
		return result;
	}

	@Override
	public int insert(String id, int row, int col) {
		return insert(new LectureRoom(id, row, col));
	}

	@Override
	public int insert(LectureRoom room) {
		System.out.println(room.getId());
		System.out.println(room.getRow());
		System.out.println(room.getCol());
		LectureRoomDao lectureRoomDao = sqlSession.getMapper(LectureRoomDao.class);
		int result = lectureRoomDao.insert(room);
		System.out.println(result);
		return result;
	}

	@Override
	public int delete(String id) {
		LectureRoomDao lectureRoomDao = sqlSession.getMapper(LectureRoomDao.class);
		int result = lectureRoomDao.delete(id);
		return result;
	}

	@Override
	public List<LectureRoom> getList() {
		LectureRoomDao lectureRoomDao = sqlSession.getMapper(LectureRoomDao.class);
		List<LectureRoom> list = lectureRoomDao.getList();
		return list;
	}

	@Override
	public int getCount() {
		LectureRoomDao lectureRoomDao = sqlSession.getMapper(LectureRoomDao.class);
		int count = lectureRoomDao.getCount();
		return count;
	}

}
