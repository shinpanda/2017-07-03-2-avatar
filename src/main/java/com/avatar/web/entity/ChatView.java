package com.avatar.web.entity;

import java.util.Date;

public class ChatView {
	private String no;
	private String content;
	private String classId;
	private String role;
	private Date regDate;

	public ChatView() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ChatView(String no, String content, String classId, String role, Date regDate) {
		super();
		this.no = no;
		this.content = content;
		this.classId = classId;
		this.role = role;
		this.regDate = regDate;
	}


	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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
