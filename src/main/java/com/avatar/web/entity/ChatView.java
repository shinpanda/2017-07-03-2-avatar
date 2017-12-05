package com.avatar.web.entity;

import java.util.Date;

public class ChatView extends Chat {
	private String role;
	private String className;

	public ChatView() {
		// TODO Auto-generated constructor stub
	}

	public ChatView(String role) {
		super();
		this.role = role;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
}
