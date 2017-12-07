package com.avatar.web.entity;

import java.util.Date;

public class Class {
	private String id;
	private String name;
	private String pwd;
	private String course;
	private Date openDate;
	private Date completeDate;
	private String openerId;
	private String lectureRoom;
	
	
	public Class() {
		// TODO Auto-generated constructor stub
	}
	
	public Class(String id, String name, String pwd, String course, Date openDate, Date completeDate, String openerId, String lectureRoom) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.course = course;
		this.openDate = openDate;
		this.completeDate = completeDate;
		this.openerId = openerId;
		this.lectureRoom = lectureRoom;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public String getOpenerId() {
		return openerId;
	}

	public void setOpenerId(String openerId) {
		this.openerId = openerId;
	}

	public String getLectureRoom() {
		return lectureRoom;
	}

	public void setLectureRoome(String lectureRoom) {
		this.lectureRoom = lectureRoom;
	}
	
	
}
