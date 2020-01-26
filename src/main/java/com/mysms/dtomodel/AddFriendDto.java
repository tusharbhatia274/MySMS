package com.mysms.dtomodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="friendlist")
public class AddFriendDto
{
	@Column(name = "friend_name")
	String friend_name;
	@Id
	@Column(name = "phone_no")
	String phone_no;
	@Column(name = "email")
	String email;
	public String getFriend_name() {
		return friend_name;
	}
	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String first_phone_no) {
		this.phone_no = first_phone_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}