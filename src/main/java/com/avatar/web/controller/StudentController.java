package com.avatar.web.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avatar.web.dao.SeatDao;
import com.avatar.web.entity.SeatView;
import com.google.gson.Gson;

@Controller
@RequestMapping("/student/*")
public class StudentController {

	@Autowired
	private SeatDao seatDao;

	@RequestMapping("seat-change-ajax")
	@ResponseBody
	public String seatChangeAjax(Model model, Principal principal) {

		StringBuilder json = new StringBuilder();
		json.append("[");

		String sessionId =principal.getName();
		String classId = seatDao.getClassId(sessionId);
		
		List<SeatView> list = seatDao.getList(classId);
		
		Collections.shuffle(list);
		
		for (int i = 0; i < list.size(); i++) {
			json.append(String.format("\"%s\"", list.get(i).getMemberName()));
			if (i + 1 < list.size()) {
				json.append(",");
			}
		}

		// String[] member = list.toArray(new String[list.size()]);

		/*
		 * for(String s : member) { System.out.println(s); }
		 * 
		 * for(int i =0; i<member.length; i++) {
		 * json.append(String.format("\"%s\"",member[i]));
		 * 
		 * if(i+1 < member.length){ json.append(","); } }
		 */

		json.append("]");

		return json.toString();
	}

	@RequestMapping("seat-change")
	public String seatChange(Model model, Principal principal) {
		//System.out.println(principal.getName());		
		
		String sessionId =principal.getName();
		
		//System.out.println(sessionId);
		
		
		
		String classId = seatDao.getClassId(sessionId);
		
		System.out.println(classId);
		
		//String classId = "1";
		List<SeatView> list = seatDao.getList(classId);
		model.addAttribute("list", list);

		return "student.seat-change";
	}

}
