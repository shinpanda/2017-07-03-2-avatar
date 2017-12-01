package com.avatar.web.entity;

public class LectureRoom {
	private String id;
	private int row;
	private int col;
	
	public LectureRoom() {
		// TODO Auto-generated constructor stub
	}

	public LectureRoom(String id, int row, int col) {
		this.id = id;
		this.row = row;
		this.col = col;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}
	
	
}
