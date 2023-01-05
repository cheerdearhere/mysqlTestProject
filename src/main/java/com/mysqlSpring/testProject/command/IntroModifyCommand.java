package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

public class IntroModifyCommand implements ICommand {
	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("IntroModifyCommand");
		
		String introID = request.getParameter("introId");
		int introId = Integer.parseInt(introID);
		String introClass = request.getParameter("introClass");
		String introName = request.getParameter("introName");
		String introTitle = request.getParameter("introTitle");
		String introContent = request.getParameter("introContent");
		String introPhoto = request.getParameter("introPhoto");
		int introHit = 0;
		System.out.println("introId: "+introId+"/introClass: "+introClass+"/introName: "+introName+"/introTitle: "+introTitle+"/introPhoto: "+introPhoto+"/introContent: "+introContent);
		
		IntroDto dto = new IntroDto(introId,introClass,introName,introTitle,introContent,introPhoto,introHit);
		BoardDao bdao = Constant.bdao;
		bdao.introModify(dto);
	}
}
