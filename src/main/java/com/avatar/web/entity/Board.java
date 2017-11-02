package com.avatar.web.entity;

import java.util.Date;

public class Board {
	String no;
	String writerId;
	String title;
	String content;
	Date regDate;
	int hit;
	String classId;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(String no, String writerId, String title, String content, Date regDate, int hit, String classId) {
		super();
		this.no = no;
		this.writerId = writerId;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.hit = hit;
		this.classId = classId;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
	
	
}
