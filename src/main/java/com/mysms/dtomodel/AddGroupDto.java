package com.mysms.dtomodel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="grouplist")
public class AddGroupDto
{
	@Id
	@GeneratedValue
	@Column(name = "group_id")
	int group_id;
	@Column(name = "group_name")
	String group_name;
	@Column(name = "email")
	String email;
	@Column(name = "contact_list")
	String contact_list;
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact_list() {
		return contact_list;
	}
	public void setContact_list(String contact_list) {
		this.contact_list = contact_list;
	}
}
