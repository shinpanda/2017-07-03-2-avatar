package com.avatar.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.avatar.web.entity.Class;


public interface ClassDao {

	List<Class> getList();
	int checkPw(String classId, String classPwd);
	List<Class> getClassList(String id);
	List<Class> getList(Integer page, String field, String query);
	int getCount();
	int newClass(Class cl);
	Class getClass(@Param("openerId")String openerId, @Param("classId")String classId);
	int editClass(Class cl);
	String getTeacherId(String classId);

}
