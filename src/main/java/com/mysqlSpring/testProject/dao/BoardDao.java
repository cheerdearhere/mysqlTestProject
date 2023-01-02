package com.mysqlSpring.testProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.mysqlSpring.testProject.dto.IntroDto;

public class BoardDao implements IBoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String introWrite(IntroDto dto) {
		System.out.println("introWrite method");
		String result;
		int res = sqlSession.insert("introWrite", dto);
		if(res==1) {
			result="success";
		}
		else {
			result="failed";
		}
		return result;
	}

	@Override
	public ArrayList<IntroDto> introList() {
		System.out.println("introList method");
		ArrayList<IntroDto> dtos = new ArrayList<IntroDto>();
		dtos=(ArrayList)sqlSession.selectList("introList");
		return dtos;
	}

	@Override
	public IntroDto introDetails(int introId) {
		System.out.println("introDetails method");
		IntroDto dto = sqlSession.selectOne("introDetails", introId);
		introUpHit(introId);
		return dto;
	}
	private void introUpHit(int introId) {
		System.out.println("introDetails up hit");
		int res = sqlSession.update("introUpHit",introId);
		System.out.println("intro result: "+res);
	}
	@Override
	public void introDelete(int introId) {
		System.out.println("introDelete method");
		int res = sqlSession.delete("introDelete",introId);
		System.out.println("introDelete result: "+res);
	}
	@Override
	public IntroDto introModifyForm(int introId) {
		System.out.println("introModifyForm method"+introId);
		IntroDto dto = sqlSession.selectOne("introModifyForm", introId);
		return dto;
	}


}
