package com.mysqlSpring.testProject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardDao implements IBoardDao {
	@Autowired
	private SqlSession sqlSession;

}
