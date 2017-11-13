package com.avatar.web.dao;

import java.util.List;
import com.avatar.web.entity.Class;


public interface ClassDao {

	List<Class> getList();
	int checkPw(String classId, String classPwd);

}
