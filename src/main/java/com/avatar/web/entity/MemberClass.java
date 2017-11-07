package com.avatar.web.entity;

public class MemberClass {

	private String id;
	private String memberId;
	private String classId;
	
	public MemberClass() {
	}
	
	
	public MemberClass(String id, String memberId, String classId) {
		this.id = id;
		this.memberId = memberId;
		this.classId = classId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	
	
	
}
