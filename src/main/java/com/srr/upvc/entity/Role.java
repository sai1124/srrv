package com.srr.upvc.entity;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
 
@Entity
public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2271758247194212954L;
	@Id
	@GeneratedValue(generator = "role_seq",strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "role_seq",sequenceName = "role_seq")
	private int role_id;
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	private String role;
}
