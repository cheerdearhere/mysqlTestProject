package com.mysqlSpring.testProject.dto;

import java.sql.Timestamp;

public class UserJoinDto {
	private int pNum;
	private String pId;
	private String pPw;
	private String pAddress;
	private String pProfile;
	private Timestamp pDate;
	private String pAuth;
	
	public UserJoinDto() {
		super();
	}
	public UserJoinDto(int pNum, String pId, String pPw, String pAddress, String pProfile, Timestamp pDate,
			String pAuth) {
		super();
		this.pNum = pNum;
		this.pId = pId;
		this.pPw = pPw;
		this.pAddress = pAddress;
		this.pProfile = pProfile;
		this.pDate = pDate;
		this.pAuth = pAuth;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpPw() {
		return pPw;
	}
	public void setpPw(String pPw) {
		this.pPw = pPw;
	}
	public String getpAddress() {
		return pAddress;
	}
	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}
	public String getpProfile() {
		return pProfile;
	}
	public void setpProfile(String pProfile) {
		this.pProfile = pProfile;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public String getpAuth() {
		return pAuth;
	}
	public void setpAuth(String pAuth) {
		this.pAuth = pAuth;
	}	
	
}
