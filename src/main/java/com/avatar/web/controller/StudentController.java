package com.avatar.web.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avatar.web.dao.SitChangeDao;
import com.avatar.web.entity.SitChangeView;
import com.google.gson.Gson;

@Controller
@RequestMapping("/student/*")
public class StudentController {

	@Autowired
	private SitChangeDao sitChangeDao;

	@RequestMapping("sit-change-ajax")
	@ResponseBody
	public String sitChangeAjax(Model model) {

		StringBuilder json = new StringBuilder();
		json.append("[");

		String classId = "1";
		List<SitChangeView> list = sitChangeDao.getList(classId);
		
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

	@RequestMapping("sit-change")
	public String sitChange(Model model) {

		String classId = "1";
		List<SitChangeView> list = sitChangeDao.getList(classId);
		model.addAttribute("list", list);

		return "student.sit-change";
	}

}
