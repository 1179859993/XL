package com.web.entity;

import java.io.Serializable;
/**
 * 注册班主任，项目经理
 * @author Administrator
 *
 */
public class User implements Serializable{
	private int uid;
	private String userName;
	private String userPass;
	private String birth;
	private int sex;
	private String address;
	private String phone;
	private String school;
	private int education;
	private int work;
	private String regdate;
	
	public User() {
	}
	public User(int uid, String userName, String userPass, String birth,
			int sex, String address, String phone, String school,
			int education, int work, String regdate) {
		this.uid = uid;
		this.userName = userName;
		this.userPass = userPass;
		this.birth = birth;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.school = school;
		this.education = education;
		this.work = work;
		this.regdate = regdate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public int getEducation() {
		return education;
	}
	public void setEducation(int education) {
		this.education = education;
	}
	public int getWork() {
		return work;
	}
	public void setWork(int work) {
		this.work = work;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
