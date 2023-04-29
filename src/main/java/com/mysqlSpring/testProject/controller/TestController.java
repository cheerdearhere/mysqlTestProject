package com.mysqlSpring.testProject.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mysqlSpring.testProject.command.ICommand;
import com.mysqlSpring.testProject.command.IntroDeleteCommand;
import com.mysqlSpring.testProject.command.IntroDetailsCommand;
import com.mysqlSpring.testProject.command.IntroListCommand;
import com.mysqlSpring.testProject.command.IntroModifyCommand;
import com.mysqlSpring.testProject.command.IntroModyfyFormCommand;
import com.mysqlSpring.testProject.command.IntroWriteCommand;
import com.mysqlSpring.testProject.command.UserJoinCommand;
import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dao.UserDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

@Controller
public class TestController {
	private ICommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder=passwordEncoder;
		Constant.passwordEncoder=passwordEncoder;
	}
	private UserDao udao;
	@Autowired
	public void setUdao(UserDao udao) {
		this.udao=udao;
		Constant.udao=udao;
	}
	private BoardDao bdao; 
	@Autowired
	public void setBdao(BoardDao bdao) {
		this.bdao=bdao;
		Constant.bdao=bdao;
	}
	
	@RequestMapping("/joinView")
	public String JoinView() {
		System.out.println("joinView request");
		return "joinView";
	}
	@RequestMapping(value="/join", produces="application/text;charset=UTF8")
	@ResponseBody
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("join request");
		com = new UserJoinCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}
		else{
			return "join-failed";
		}
	}
	@RequestMapping("/loginView")
	public String loginView() {
		System.out.println("loginView 요청");
		return "loginView";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("main request");
		getUsername(authentication, request);
		
		//getUsername() method에서 HttpServletRequest에 저장한 내용확인
		String username = (String)request.getAttribute("username");
		String auth = (String)request.getAttribute("auth");
		System.out.println("user: "+username+"//auth: "+auth);
		
		return "main";
	}
	private void getUsername(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String username = userDetails.getUsername();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString();
		request.setAttribute("username", username);
		request.setAttribute("auth",auth);
	}
	
	@RequestMapping("/processLogin")
	public ModelAndView processLogin(
			//before log in
			@RequestParam(value="log", required=false) String log,
			//log out request
			@RequestParam(value="logout", required=false) String logout,
			//login error 
			@RequestParam(value="error",required=false) String error,
			//social login
			HttpSession session, Model model) {
		System.out.println("log process controller");
		ModelAndView mav = new ModelAndView();
		if(log!=null&&log!="") {
			mav.addObject("log", "before login");
		}
		if(logout!=null&&logout!="") {
			mav.addObject("logout", "You've been logged out successfully");
		}
		if(error!=null && error!="") {
			mav.addObject("error","Invalid username or password");
		}
		mav.setViewName("loginView");
		return mav;
	}
	
	@RequestMapping("/logoutView")
	public String logoutView(HttpServletRequest request, Model model) {
		System.out.println("log-out request ");
		return "logoutView";
	}
//intro
	@RequestMapping("/intro")
	public String introView(HttpServletRequest request,Model model) {
		System.out.println("intro request");
		//dto list call
		com = new IntroListCommand();
		com.execute(request, model);
		return "intro";
	}

	@RequestMapping("/introWriteView")
	public String introWriteView(HttpServletRequest request, Model model) {
		System.out.println("intro write view request");
		return "introWriteView";
	}
	
	@RequestMapping("/introWrite")
	public String introWrite(MultipartHttpServletRequest mphRequest, Model model) {
		System.out.println("introWrite request");
		String introClass = mphRequest.getParameter("introClass");
		String introName = mphRequest.getParameter("introName");
		String introTitle = mphRequest.getParameter("introTitle");
		String introPhoto = null;
		String introContent = mphRequest.getParameter("introContent");
		System.out.println(introClass+"/"+introName+"/"+introTitle+"/"+introContent);
		
		MultipartFile mf = mphRequest.getFile("introPhoto");
		
		String originalFileName = mf.getOriginalFilename();
		long preName=System.currentTimeMillis();
		long fileSize=mf.getSize();
		System.out.println(originalFileName+": "+fileSize);
		
		//file path, tomcat용 path
		String path = "/Users/choikmacbookair/Desktop/workspace/testProject/src/main/webapp/resources/upimage/";
		String tomcatPath = "/Users/tomcat/apache-tomcat-9.0.63/wtpwebapps/testProject/resources/upimage/";
		//file path
		String safeFile = path+preName+originalFileName;
		String safeFile2= tomcatPath+preName+originalFileName;
		introPhoto = preName+originalFileName;
		IntroDto dto = new IntroDto(0,introClass,introName,introTitle,introContent,introPhoto,0);
		
		mphRequest.setAttribute("introDto", dto);
		
		com=new IntroWriteCommand();
		com.execute(mphRequest,model);
		
		Map<String, Object> map = model.asMap();
		String res = (String)map.get("result");
		System.out.println("res: " + res);
		if(res.equals("success")) {
			try {
				mf.transferTo(new File(safeFile));
				mf.transferTo(new File(safeFile2));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:main";
		}
		else {
			return "redirect:main";
		}
	}
	@RequestMapping("/introDetails")
	public String introDetails(HttpServletRequest request, Model model) {
		System.out.println("introDetails request");
		com=new IntroDetailsCommand();
		com.execute(request, model);
		
		if(model.containsAttribute("introDetails")) {
			System.out.println("introDetails dto select Success");
			return "introDetails";
		}
		else {
			return "detailsError";
		}
	}
	@RequestMapping("/introModifyForm")
	public String introModifyForm(HttpServletRequest request, Model model) {
		System.out.println("introModifyForm request");
		com=new IntroModyfyFormCommand();
		com.execute(request, model);
		return "introModifyView";
	}
	@RequestMapping("/introDelete")
	public String introDelete(HttpServletRequest request, Model model) {
		System.out.println("introDelete request");
		com=new IntroDeleteCommand(); 
		com.execute(request, model);
		com = new IntroListCommand();
		com.execute(request, model);
		return "intro";
	}
	@RequestMapping("/introModify")
	public String introModify(HttpServletRequest request, Model model) {
		System.out.println("introModify request");
		com=new IntroModifyCommand();
		com.execute(request, model);
		com = new IntroListCommand();
		com.execute(request, model);
		return "intro";
	}
	
	//test
	@RequestMapping("/downloadRequest")
	public void downloadRequest(HttpServletRequest request,HttpServletResponse response) {
		
		//afterProject.txt
		String fileName = "afterProject.txt";//request.getParameter("fileName")
		//구별시킨파일이름: 
		String realFileName = "0123456789012345678901234567890afterProject.txt";
		//파일이 위치한 경로: 
		String filePath = "/Users/choikmacbookair/Desktop/"+realFileName;
		//String path = "F:\\uploadFile\\jarzip.PNG"; // 경로에 접근할 때 역슬래시('\') 사용
		
		File file = new File(filePath);	
		int fileSize = (int) file.length();
		
		//response 설정
		response.setContentType("application/octet-stream");
		//파일명 지정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\";");
		//변경사항 인코
		response.setHeader("Content-Transfer-Encoding", "binary");
		System.out.println(file.getName());
		response.setContentLength(fileSize);
		
		//FileInputStream으로 읽어와 response로 반환
		try {
			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
			
			/*1024바이트씩 계속 읽으면서 outputStream에 저장, 
                 -1이 나오면 더이상 읽을 파일이 없음
			  int read = 0;
              byte[] buffer = new byte[1024];
              while ((read = fileInputStream.read(buffer)) != -1) { 
              out.write(buffer, 0, read);
              }
			 */
		} catch(IOException e) {
			System.out.println("fileInputStream 에러: "+filePath);
			e.printStackTrace();
		}
		
		System.out.println(fileName+" 다운로드");
	}
	


}
