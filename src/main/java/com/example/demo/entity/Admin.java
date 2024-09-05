package com.example.demo.entity;

import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String email;
    private String password;
    private String name;
    private String contactNumber;
    private String workExperience;
    private int numberOfCertifications;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getWorkExperience() {
		return workExperience;
	}
	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}
	public int getNumberOfCertifications() {
		return numberOfCertifications;
	}
	public void setNumberOfCertifications(int numberOfCertifications) {
		this.numberOfCertifications = numberOfCertifications;
	}	
	
}
