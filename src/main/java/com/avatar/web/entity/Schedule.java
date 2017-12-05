package com.avatar.web.entity;

import java.util.Date;

public class Schedule {
	private String id;
	private Date dateTime;
	private String subject;
	private String content;
	private String classId;
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public Schedule(String id, Date dateTime, String subject, String content, String classId) {
		super();
		this.id = id;
		this.dateTime = dateTime;
		this.subject = subject;
		this.content = content;
		this.classId = classId;
	}
	
	

	public Schedule(Date dateTime, String subject, String content, String classId) {
		super();
		this.dateTime = dateTime;
		this.subject = subject;
		this.content = content;
		this.classId = classId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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
	
	
}
