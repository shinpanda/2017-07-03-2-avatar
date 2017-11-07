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

import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.dao.SitChangeDao;
import com.avatar.web.entity.SitChangeView;

public class HeaderPreparerController implements ViewPreparer  {
	
	@Autowired
	private SitChangeDao sitChangeDao;

	@Autowired
	private MemberRoleDao memberRoleDao;

	
	
	
	@Override
	public void execute(Request context, AttributeContext attributeContext ) {
		
		
		Authentication authentication =SecurityContextHolder.getContext().getAuthentication();
	    System.out.println(authentication.getName());
		
		String sessionId =authentication.getName();
		List<SitChangeView> list = sitChangeDao.getHeader(sessionId);
		attributeContext.putAttribute("classInfo", new Attribute(list),true); 
		
	
		String role = memberRoleDao.getRole(sessionId);
		System.out.println(role+"////controllor");
		attributeContext.putAttribute("memberRole", new Attribute(role),true); 
	}

}
