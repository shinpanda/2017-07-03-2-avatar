package com.avatar.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ClassDao;
import com.avatar.web.entity.Class;

public class AdminService {

	@Autowired
	ClassDao classDao;
	
	public List<Class> getClassList(Integer page, String field, String query) {
		List<Class> list = classDao.getList(page, field, query);
		
		return list;
	}

	public int getClassCount() {
		int count = classDao.getCount();
		return count;
	}

}
