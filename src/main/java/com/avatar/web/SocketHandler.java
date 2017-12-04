package com.avatar.web;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.avatar.web.service.MemberService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
	// 1. 첫번째 버전은 반별로 기능하지 않음 / 선생님 학생 구분 없음.
	// private List<WebSocketSession> list;
	// 2. 반별로 나눔 선생님, 학생 구분 없음
	private Map<WebSocketSession, String> map;

	@Autowired
	private MemberService service;

	public SocketHandler() {
		// list = new ArrayList<WebSocketSession>();
		map = new HashMap<WebSocketSession, String>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		String classId = service.getClassId(session.getPrincipal().getName());
		// System.out.println(className);
		// list.add(session);
		map.put(session, classId);
		System.out.println("접속 : classId " + classId);

		// System.out.println("session:" + session);
		System.out.println(session.getRemoteAddress().getHostName());
	}

	// 클라이언트에서 send()로 메시지 발송을 하였을 때 이벤트
	// 1. 클라이언트가 보낸 메시지를 디비에 저장.
	// 2. 클라이언트에서 send하였을 때 해당 클래스 사람들에게 메시지를 broadcast
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		// System.out.println("test:"+session.getPrincipal().getName());
		JsonParser jsonParser = new JsonParser();
		System.out.println(message.getPayload());
		String msg = message.getPayload().toString().replace("\\n", "<br/>");
		// JsonObject jsonObject = (JsonObject) jsonParser.parse(message.getPayload());
		JsonObject jsonObject = (JsonObject) jsonParser.parse(msg);

		if (!jsonObject.isJsonNull()) {

			if (jsonObject.get("msgType").getAsString().equals("chat")) {
				
				// chat
				String[] temp = jsonObject.get("content").toString().split("\"");
				String content = temp[1];
				/*
				 * temp = jsonObject.get("classId").toString().split("\""); String classId =
				 * temp[1];
				 */
				// jsonObject.remove("id");
				// System.out.println(session.getPrincipal().getName());
				// content = content.replace("\\n", "<br/>");
				int result = service.insertChat(content, session.getPrincipal().getName());
				System.out.println("result" + result);
				// session.sendMessage(new TextMessage(message.getPayload()));
				// session.sendClass(new TextMessage(message.getPayload()));
				// sendClass(message);
				System.out.println("sendClass classId : " + service.getClassId(session.getPrincipal().getName()));
				// sendClass(message, service.getClassId(session.getPrincipal().getName()));

				sendClass(new TextMessage(msg.getBytes()), service.getClassId(session.getPrincipal().getName()), session.getRemoteAddress().getAddress());
			}
			else {
				// push//
				System.out.println("오긴 오니?");
				if(jsonObject.get("role").getAsString().equals("teacher")) 
					sendClass(new TextMessage(msg.getBytes()), service.getClassId(session.getPrincipal().getName()), session.getRemoteAddress().getAddress());
				if(jsonObject.get("role").getAsString().equals("student"))
					sendTeacher(new TextMessage(msg.getBytes()), service.getClassId(session.getPrincipal().getName()));
			}
		}
	}

	private void sendTeacher(TextMessage message, String classId) {
		for (WebSocketSession session : map.keySet()) {
			System.out.println(service.getTeacherId(classId));
			if(session.getPrincipal().getName().equals(service.getTeacherId(classId))) {
				if (session.isOpen()) {
					try {
						session.sendMessage(message);
					} catch (Exception ignored) {
						// this.logger.error("fail to send message!", ignored);
						System.out.println("fail to send message!" + ignored);
					}
				}
				break;
			}
		}
	}

	// sendMessage에 classId 도 넘겨 받도록 해야함.
	public void sendClass(TextMessage message, String classId, InetAddress ipAddress) {
		// for (WebSocketSession session : list) {
		for (WebSocketSession session : map.keySet()) {
			//if (map.get(session).equals(classId) && session.getRemoteAddress().getAddress() != ipAddress) {
			if (map.get(session).equals(classId)) {
				if (session.isOpen()) {
					try {
						session.sendMessage(message);
					} catch (Exception ignored) {
						// this.logger.error("fail to send message!", ignored);
						System.out.println("fail to send message!" + ignored);
					}
				}
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// this.logger.error("web socket error!", exception);
		System.out.println("web socket error!" + exception);
	}

	@Override
	public boolean supportsPartialMessages() {
		// this.logger.info("call method!");
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

		// list.remove(session);
		map.remove(session);
		// this.logger.info("remove session!");

		System.out.println("remove session!");
	}

}
