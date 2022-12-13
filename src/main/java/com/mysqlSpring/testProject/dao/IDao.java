package com.mysqlSpring.testProject.dao;

import com.mysqlSpring.testProject.dto.UserJoinDto;

public interface IDao {
	public String userJoin(UserJoinDto dto);
}
