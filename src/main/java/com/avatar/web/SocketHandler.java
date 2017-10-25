package com.avatar.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.avatar.web.dao.ChatDao;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean{
	// 1. 첫번째 버전은 반별로 기능하지 않음 / 선생님 학생 구분 없음.
	//private List<WebSocketSession> list;
	private Map<WebSocketSession, String> map;
	
	
	@Autowired
	private ChatDao chatDao;
	
	public SocketHandler() {
		//list = new ArrayList<WebSocketSession>();
		map = new HashMap<WebSocketSession, String>();
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		//list.add(session);
		map.put(session, "c");
		
		System.out.println("session:"+session);
		System.out.println(session.getRemoteAddress().getHostName());
	}
	
	// 클라이언트에서 send()로 메시지 발송을 하였을 때 이벤트
	// 1. 클라이언트가 보낸 메시지를 디비에 저장.	
	// 2. 클라이언트에서 send하였을 때 해당 클래스 사람들에게 메시지를 broadcast	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		
		JsonParser jsonParser = new JsonParser();
		
		JsonObject jsonObject = (JsonObject) jsonParser.parse(message.getPayload());

		String[] temp = jsonObject.get("content").toString().split("\"");
		String content = temp[1];
		temp = jsonObject.get("classId").toString().split("\"");
		String classId = temp[1];
		System.out.println(classId);
		jsonObject.remove("id");
		
		System.out.println(jsonObject);
		//session.sendMessage(new TextMessage(message.getPayload()));
		session.sendMessage(new TextMessage(message.getPayload()));
		/*System.out.println("payload : "+message.getPayload());
		System.out.println("toString : "+message.toString());*/
	}
	//sendMessage에 classId 도 넘겨 받도록 해야함.
	public void sendMessage(String message, String classId) {
		//for (WebSocketSession session : this.list) {
		for(WebSocketSession session : map.keySet()) {
			if(map.get(session) == "c") {
				if (session.isOpen()) {
					try {
						session.sendMessage(new TextMessage(message));
					} catch (Exception ignored) {
						//this.logger.error("fail to send message!", ignored);
						System.out.println("fail to send message!"+ ignored);
					}
				}
			}
		}
	}
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		//this.logger.error("web socket error!", exception);
		System.out.println("web socket error!" + exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		//this.logger.info("call method!");
		System.out.println("call method!");
		return super.supportsPartialMessages();
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}
	// 클라이언트에서 연결을 종료할 경우 발생하는 이벤트
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		//list.remove(session);
		map.remove(session);
		//this.logger.info("remove session!");
		
		System.out.println("remove session!");
	}

}
