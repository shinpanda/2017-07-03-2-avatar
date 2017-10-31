package com.avatar.web.entity;

import java.util.Date;

public class Chat {
	private String no;
	private String content;
	private Date regDate;
	private String writerId;
	private String classId;
	
	public Chat() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Chat(String content, String writerId, String classId) {
		super();
		this.content = content;
		this.writerId = writerId;
		this.classId = classId;
	}



	public Chat(String no, String content, Date regDate, String writerId, String classId) {
		super();
		this.no = no;
		this.content = content;
		this.regDate = regDate;
		this.writerId = writerId;
		this.classId = classId;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
	
	
}
