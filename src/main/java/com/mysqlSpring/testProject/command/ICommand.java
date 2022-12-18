package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface ICommand {
	public void execute(HttpServletRequest request, Model model);
}
