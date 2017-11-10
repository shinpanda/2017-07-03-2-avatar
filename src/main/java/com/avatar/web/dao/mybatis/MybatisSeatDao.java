package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.SeatDao;
import com.avatar.web.entity.Member;
import com.avatar.web.entity.SeatView;




public class MybatisSeatDao implements SeatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<SeatView> getList(String classId) {
		SeatDao seatDao = sqlSession.getMapper(SeatDao.class);
		List<SeatView> list = seatDao.getList(classId);

	return list;
	}


	@Override

	public String getClassId(String sessionId) {
		//System.out.println(sessionId);
		SeatDao seatDao = sqlSession.getMapper(SeatDao.class);
		
		String classId = seatDao.getClassId(sessionId);
		
		return classId;
	}

	public List<SeatView> getHeader(String sessionId) {
		SeatDao seatDao = sqlSession.getMapper(SeatDao.class);
		List<SeatView> list = seatDao.getHeader(sessionId);
		return list;

	}



		

}
