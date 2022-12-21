package com.mysqlSpring.testProject.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

public class IntroListCommand implements ICommand {
	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao bdao = Constant.bdao;
		ArrayList<IntroDto> dtos = bdao.introList();
		model.addAttribute("allList", dtos);
	}

}
