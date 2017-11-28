/*package com.avatar.web;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.WebSocketSession;

import com.avatar.web.service.MemberService;

@ServerEndpoint(value="/resource/chat-server")
public class ChatServer {
	@Autowired
	private MemberService service;
	
	//private static Set<Session> sessionAll = Collections.synchronizedSet(new HashSet<Session>()); // 얘를 쓸 때 잠금장치를 걸어줌 1명에 한명씩 만들어짐
	private static Map<WebSocketSession, String> sessionAll = Collections.synchronizedMap(new HashMap<WebSocketSession, String>());
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		sessionAll.add(session);
		String classId = service.getClassId(session.);
		//this.session = session;
		//session.getBasicRemote()
		System.out.print("aaaaaaaa");
	}
	
	@OnMessage
	public void onTextMessage(Session session, String data) throws IOException {
		for(Session s:sessionAll) {
			s.getBasicRemote().sendText(data);
		}
		System.out.println(session.getId());
		System.out.println(data);
	}
}
*/