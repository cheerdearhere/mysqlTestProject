package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.util.Constant;

public class IntroDeleteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		String introID = (String)request.getAttribute("introId");
		System.out.println(introID+" delete command");
		int introId = Integer.parseInt(introID);
		
		BoardDao bdao = Constant.bdao;
		bdao.introDelete(introId);
	}
}
