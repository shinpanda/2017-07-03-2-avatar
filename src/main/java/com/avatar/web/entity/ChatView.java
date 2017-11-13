package com.avatar.web.entity;

import java.util.Date;

public class ChatView extends Chat {
	private String role;

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
	
}
