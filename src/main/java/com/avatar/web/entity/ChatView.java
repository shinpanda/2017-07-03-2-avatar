package com.avatar.web.entity;

import java.util.Date;

public class ChatView {
	private String content;
	private String classId;
	private String role;
	private Date regDate;
	
	public ChatView(String content, String classId, String role, Date regDate) {
		super();
		this.content = content;
		this.classId = classId;
		this.role = role;
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
