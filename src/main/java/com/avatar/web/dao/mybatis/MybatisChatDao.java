package com.avatar.web.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.avatar.web.dao.ChatDao;
import com.avatar.web.entity.Chat;
import com.avatar.web.entity.ChatView;

public class MybatisChatDao implements ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		
	@Override
	public List<ChatView> getList(String classId) {
		ChatDao chatDao = sqlSession.getMapper(ChatDao.class);
		return chatDao.getList(classId);
	}


	@Override
	public int insert(String content, String writerId, String classId) {
		return insert(new Chat(content, writerId, classId));
	}


	@Override
	public int insert(Chat chat) {
		ChatDao chatDao = sqlSession.getMapper(ChatDao.class);

		return chatDao.insert(chat);
	}
	
	


}
