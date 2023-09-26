package com.entity;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String v1,String v2,String v3)
	{
		name = v1;
		email = v2;
		password = v3;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
