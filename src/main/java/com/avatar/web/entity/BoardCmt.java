package com.avatar.web.entity;

import java.util.Date;

public class BoardCmt {
	String no;
	String content;
	Date regDate;
	String boardNo;
	String writerId;
	public BoardCmt() {
		// TODO Auto-generated constructor stub
	}
	
	
	public BoardCmt(String no, String content, Date regDate, String boardNo, String writerId) {
		super();
		this.no = no;
		this.content = content;
		this.regDate = regDate;
		this.boardNo = boardNo;
		this.writerId = writerId;
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
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
	
}
