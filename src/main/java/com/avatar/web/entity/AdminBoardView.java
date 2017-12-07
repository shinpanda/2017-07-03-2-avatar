package com.avatar.web.entity;

import java.util.Date;

public class AdminBoardView extends Board {
	String adminBoardId;
	String boardId;
	
	int countCmt;

	public AdminBoardView() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AdminBoardView(String adminBoardId, String boardId, int countCmt) {
		super();
		this.adminBoardId = adminBoardId;
		this.boardId = boardId;
		this.countCmt = countCmt;
	}
	
	public String getAdminBoardId() {
		return adminBoardId;
	}


	public void setAdminBoardId(String adminBoardId) {
		this.adminBoardId = adminBoardId;
	}


	public String getBoardId() {
		return boardId;
	}


	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}


	public int getCountCmt() {
		return countCmt;
	}


	public void setCountCmt(int countCmt) {
		this.countCmt = countCmt;
	}



	
	
	
	
	
}
