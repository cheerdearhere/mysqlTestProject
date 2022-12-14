package com.mysqlSpring.testProject.dao;

import java.util.ArrayList;

import com.mysqlSpring.testProject.dto.IntroDto;

public interface IBoardDao {
	public String introWrite(IntroDto dto);
	public ArrayList<IntroDto> introList();
	public IntroDto introDetails (int introID);
	public void introDelete(int introId);
	public IntroDto introModifyForm(int introId);
	public void introModify(IntroDto dto);
}
