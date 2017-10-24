package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.ChatView;

public interface ChatDao {
	List<ChatView> getList(String classId);
	
}
