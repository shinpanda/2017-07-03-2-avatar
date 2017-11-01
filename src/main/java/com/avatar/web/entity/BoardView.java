package com.avatar.web.entity;

public class BoardView extends Board{
	private int countCmt;
	
	public BoardView() {
		super();
	}
	
	public BoardView(int countCmt) {
		super();
		this.countCmt = countCmt;
	}
	
	public int getCountCmt() {
		return countCmt;
	}

	public void setCountCmt(int countCmt) {
		this.countCmt = countCmt;
	}
	
	
	
}
