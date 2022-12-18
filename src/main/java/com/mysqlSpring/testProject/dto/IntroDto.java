package com.mysqlSpring.testProject.dto;

public class IntroDto {
	private int introId;
	private String introClass;
	private String introName;
	private String introTitle;
	private String introContent;
	private String introPhoto;
	private int introHit;
	
	public IntroDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IntroDto(int introId, String introClass, String introName, String introTitle, String introContent,
			String introPhoto, int introHit) {
		super();
		this.introId = introId;
		this.introClass = introClass;
		this.introName = introName;
		this.introTitle = introTitle;
		this.introContent = introContent;
		this.introPhoto = introPhoto;
		this.introHit = introHit;
	}
	public int getIntroId() {
		return introId;
	}
	public void setIntroId(int introId) {
		this.introId = introId;
	}
	public String getIntroClass() {
		return introClass;
	}
	public void setIntroClass(String introClass) {
		this.introClass = introClass;
	}
	public String getIntroName() {
		return introName;
	}
	public void setIntroName(String introName) {
		this.introName = introName;
	}
	public String getIntroTitle() {
		return introTitle;
	}
	public void setIntroTitle(String introTitle) {
		this.introTitle = introTitle;
	}
	public String getIntroContent() {
		return introContent;
	}
	public void setIntroContent(String introContent) {
		this.introContent = introContent;
	}
	public String getIntroPhoto() {
		return introPhoto;
	}
	public void setIntroPhoto(String introPhoto) {
		this.introPhoto = introPhoto;
	}
	public int getIntroHit() {
		return introHit;
	}
	public void setIntroHit(int introHit) {
		this.introHit = introHit;
	}
}
