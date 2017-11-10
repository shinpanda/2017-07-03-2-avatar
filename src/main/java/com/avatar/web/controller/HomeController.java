package com.avatar.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.avatar.web.entity.BoardView;
import com.avatar.web.service.BoardService;
import com.avatar.web.service.HomeService;

@Controller
@RequestMapping("/*")
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	@RequestMapping("index")
	public String index(Principal principal, Model model) {
		String classId = service.getClassId(principal.getName());
		model.addAttribute("noticeList", service.getNoticeList(classId));
		model.addAttribute("questionList", service.getQuestionList(classId));
		model.addAttribute("infomationList", service.getInfomationList(classId));
		return "home.index";
	}
	
	@ResponseBody
	@RequestMapping("upload")
	public String upload(String now, MultipartFile file, HttpServletRequest request) throws IOException {
		if (!file.isEmpty()) {

			ServletContext ctx = request.getServletContext();
			String path = ctx.getRealPath("/resource/upload");
			System.out.println(path);
			String fileName = file.getOriginalFilename();
			path += File.separator+now+fileName;
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
