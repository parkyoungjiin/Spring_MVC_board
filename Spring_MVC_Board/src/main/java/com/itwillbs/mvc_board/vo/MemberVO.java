package com.itwillbs.mvc_board.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberVO {
	private String name;
	private String id;
	private String passwd;
	private String email;
	private String email1;
	private String email2;
	private String gender;
	private Date date;
	private String auth_status;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}	
	public void setEmail(String email) {
		this.email = email;
		email1 = email.split("@")[0];
		email2 = email.split("@")[1];
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
//		email = email1 + "@" + email2;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAuth_status() {
		return auth_status;
	}
	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}
	
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", id=" + id + ", passwd=" + passwd + ", email=" + email + ", email1="
				+ email1 + ", email2=" + email2 + ", gender=" + gender + ", date=" + date + ", auth_status="
				+ auth_status + "]";
	}
	
	
		
	

}//BoardBean 끝
