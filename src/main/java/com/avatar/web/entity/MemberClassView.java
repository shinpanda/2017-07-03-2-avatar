package com.avatar.web.entity;

import java.util.Date;

public class MemberClassView extends MemberClass{
	private String memberName;
	private String className;
	private Date classOpenDate;
	private String memberRole;
	
	
	public MemberClassView() {
	}
	
	public MemberClassView(String memberName, String className, Date classOpenDate, String memberRole) {
		super();
		this.memberName = memberName;
		this.className = className;
		this.classOpenDate = classOpenDate;
		this.memberRole = memberRole;
	}




	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Date getClassOpenDate() {
		return classOpenDate;
	}
	public void setClassOpenDate(Date classOpenDate) {
		this.classOpenDate = classOpenDate;
	}
	public String getMemberRole() {
		return memberRole;
	}
	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}
	
}
