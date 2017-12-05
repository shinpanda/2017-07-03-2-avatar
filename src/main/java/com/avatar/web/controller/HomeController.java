package com.avatar.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.dao.MemberRoleDao;
import com.avatar.web.entity.BoardView;
import com.avatar.web.entity.DateData;
import com.avatar.web.entity.Schedule;
import com.avatar.web.service.BoardService;
import com.avatar.web.service.HomeService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/*")
public class HomeController {

	@Autowired
	private HomeService service;

	@RequestMapping("index")
	public String index(Principal principal, Model model, DateData dateData) {

		if (service.getRole(principal.getName()).equals("ROLE_ADMIN")) {
			return "redirect:admin/member";
		}
		else {
			String classId = service.getClassId(principal.getName());
			model.addAttribute("noticeList", service.getNoticeList(classId));
			model.addAttribute("questionList", service.getQuestionList(classId));
			model.addAttribute("infomationList", service.getInfomationList(classId));

			return "home.index";
		}
	}
	
	@ResponseBody
	@RequestMapping("schedule-check")
	public String scheduleCheck(String date,Principal principal) {
		/*
		System.out.println(date);
		System.out.println(principal.getName());*/
		List<Schedule> list = service.getScheduleCheck(date,principal.getName());
		String json ="";
		Gson gson = new Gson();
		json = gson.toJson(list);
	
		return json;
	}
	
	@ResponseBody
	@RequestMapping("schedule-upload")
	public String scheduleUpload(String json, Principal principal) throws ParseException {
		System.out.println(json);
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject) jsonParser.parse(json);
		
		//jsonObject.get("msgType").getAsString();
		String date = jsonObject.get("date").getAsString();
		String subject = jsonObject.get("subject").getAsString();
		String content = jsonObject.get("content").getAsString();
		String writerId = principal.getName();
		int result = service.insertSchedule(date, subject, content, writerId);
		return "aa";
	}
	@ResponseBody
	@RequestMapping("schedule-delete")
	public String scheduleDelete(String id) {
		
		int result = service.deleteSchedule(id);
		
		return "0";
	}

	@ResponseBody
	@RequestMapping("upload")
	public String upload(String now, MultipartFile file, HttpServletRequest request) throws IOException {
		if (!file.isEmpty()) {

			ServletContext ctx = request.getServletContext();
			String path = ctx.getRealPath("/resource/upload");
			System.out.println(path);
			String fileName = file.getOriginalFilename();
			path += File.separator + now + fileName;
			File f = new File(path);

			InputStream fis = file.getInputStream();
			OutputStream fos = new FileOutputStream(f);

			byte[] buf = new byte[1024];

			int size = 0;

			while ((size = fis.read(buf)) > 0)
				fos.write(buf, 0, size);

			fis.close();
			fos.close();
		}

		return "aa";
	}
}
