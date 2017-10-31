package com.avatar.web.dao;

import java.util.List;

import com.avatar.web.entity.Chat;
import com.avatar.web.entity.ChatView;

public interface ChatDao {
	List<ChatView> getList(String classId);

	int insert(String content, String writerId, String classId);
	int insert(Chat chat);
}
