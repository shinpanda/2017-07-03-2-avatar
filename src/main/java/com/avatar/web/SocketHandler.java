package com.avatar.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.avatar.web.dao.ChatDao;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean{
	// 1. 첫번째 버전은 반별로 기능하지 않음 / 선생님 학생 구분 없음.
	private List<WebSocketSession> list;
	
	@Autowired
	private ChatDao chatDao;
	
	public SocketHandler() {
		list = new ArrayList<WebSocketSession>();
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		list.add(session);
		
	}
	
	
	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
