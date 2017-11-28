package com.avatar.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
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
import com.avatar.web.service.BoardService;
import com.avatar.web.service.HomeService;

@Controller
@RequestMapping("/*")
public class HomeController {

	@Autowired
	private HomeService service;
	
	@RequestMapping("index")
	public String index(Principal principal, Model model,  DateData dateData) {
		
		
		if(service.getRole(principal.getName())=="ROLE_ADMIN")
			return "redirect:admin/index";
		String classId = service.getClassId(principal.getName());
		model.addAttribute("noticeList", service.getNoticeList(classId));
		model.addAttribute("questionList", service.getQuestionList(classId));
		model.addAttribute("infomationList", service.getInfomationList(classId));
		
		
		 Calendar cal = Calendar.getInstance();
	      DateData calendarData;
	      //�˻� ��¥
	            if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
	               dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
	            }
	            //�˻� ��¥ end

	            Map<String, Integer> today_info =  dateData.today_info(dateData);
	            List<DateData> dateList = new ArrayList<DateData>();
	            
	            //�������� �޷� ������ ����Ʈ�� ������ ���� ����
	            //�ϴ� ���� �ε������� �ƹ��͵� ���� ������ ����
	            for(int i=1; i<today_info.get("start"); i++){
	               calendarData= new DateData(null, null, null, null);
	               dateList.add(calendarData);
	            }
	            
	            //��¥ ����
	            for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
	               if(i==today_info.get("today")){
	                  calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
	               }else{
	                  calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
	               }
	               dateList.add(calendarData);
	            }

	            //�޷� ��� �� �����ͷ� ����
	            int index = 7-dateList.size()%7;
	            
	            if(dateList.size()%7!=0){
	               
	               for (int i = 0; i < index; i++) {
	                  calendarData= new DateData(null, null, null, null);
	                  dateList.add(calendarData);
	               }
	            }
	            System.out.println(dateList);
	            
	            //�迭�� ����
	            model.addAttribute("dateList", dateList);      //��¥ ������ �迭
	            model.addAttribute("today_info", today_info);
		
		return "home.index";
	}
	
	
	
	
	
	
/*	
	@RequestMapping(value="calendar", method=RequestMethod.GET)
	   public String calendar(
	        
	         Model model, HttpServletRequest request){
	      
	     
	            return "test.calendar";
	   }*/
	
	
	
	
	
	
	
	
	
	
	
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
