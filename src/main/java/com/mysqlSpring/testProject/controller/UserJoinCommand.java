package com.mysqlSpring.testProject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.mysqlSpring.testProject.command.UserCommand;
import com.mysqlSpring.testProject.dao.UserDao;
import com.mysqlSpring.testProject.dto.UserJoinDto;
import com.mysqlSpring.testProject.util.Constant;

public class UserJoinCommand implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		int num = (int) System.currentTimeMillis();
		String id = request.getParameter("pid");
		String pw = request.getParameter("ppw");
		String address = request.getParameter("paddress");
		String profile = request.getParameter("pprofile");
		String pw_org = pw;
		pw = passwordEncoder.encode(pw_org);
		UserJoinDto dto = new UserJoinDto(num,id,pw,address,profile,null,null);
		System.out.println(id+"/"+num+"/"+pw+address+"/"+profile);
		
		UserDao udao = Constant.udao;
		String result = udao.userJoin(dto);
		request.setAttribute("result", result);
	}

}
