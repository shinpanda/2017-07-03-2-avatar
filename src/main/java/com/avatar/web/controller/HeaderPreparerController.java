package com.avatar.web.controller;

import java.security.Principal;
import java.util.List;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.entity.MemberClass;
import com.avatar.web.entity.MemberClassView;

public class HeaderPreparerController implements ViewPreparer  {
	
	@Autowired
	private MemberClassDao memberClassDao;

	@Autowired
	private MemberRoleDao memberRoleDao;

	
	@Override
	public void execute(Request context, AttributeContext attributeContext) {
		Authentication authentication =SecurityContextHolder.getContext().getAuthentication();
		String sessionId =authentication.getName();
		String role = memberRoleDao.getRole(sessionId);
		System.out.println(role+"////controllor");
		attributeContext.putAttribute("memberRole", new Attribute(role),true);
		
		int classEmpty = memberClassDao.getClassEmpty(sessionId);
		System.out.println("classEmpty: "+classEmpty);
		attributeContext.putAttribute("classEmpty",new Attribute(classEmpty),true);
		
		if(role!="ROLE_ADMIN") {
			MemberClassView mcv = memberClassDao.getHeader(sessionId);
			attributeContext.putAttribute("classInfo", new Attribute(mcv),true);
		}
	}

}
