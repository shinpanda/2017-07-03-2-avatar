package com.avatar.web.entity;

public class SitChangeView {
	private String memberId;
	private String memberName;
	private String classId;
	private String className;
	
	
	public SitChangeView() {
	}
	public String getMemberName() {
		return memberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
