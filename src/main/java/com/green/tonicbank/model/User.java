package com.green.tonicbank.model;

import java.util.Date;

public class User {
	private String userId;
	private String pwd; 
	private String nick;
	private String email;
	private Date regDate;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String pwd, String nick, String email, Date regDate) {
		super();
		this.userId = userId;
		this.pwd = pwd;
		this.nick = nick;
		this.email = email;
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", pwd=" + pwd + ", nick=" + nick + ", email=" + email + ", regDate="
				+ regDate + "]";
	}
	
}
