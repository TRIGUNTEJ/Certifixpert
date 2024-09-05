package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;



@Entity
public class certifications {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String organizationName;
    private String certificationName;
    private String certificationCode;
    private String certificationLevel;
    private String examFormat;
    private String duration;
    private String passingScore;
    private String validityPeriod;
    private String Cost;
    private String voucherAvailabilty;
    @Column(length = 1000000000)
    private String description1;
    @Column(length = 1000000000)
    private String description2;
    @Column(length = 1000000000)
    private String description3;
	private int views;
	private String subcribeCost;
	
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getCertificationName() {
		return certificationName;
	}
	public void setCertificationName(String certificationName) {
		this.certificationName = certificationName;
	}
	public String getCertificationCode() {
		return certificationCode;
	}
	public void setCertificationCode(String certificationCode) {
		this.certificationCode = certificationCode;
	}
	public String getCertificationLevel() {
		return certificationLevel;
	}
	public void setCertificationLevel(String certificationLevel) {
		this.certificationLevel = certificationLevel;
	}
	public String getExamFormat() {
		return examFormat;
	}
	public void setExamFormat(String examFormat) {
		this.examFormat = examFormat;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getPassingScore() {
		return passingScore;
	}
	public void setPassingScore(String passingScore) {
		this.passingScore = passingScore;
	}
	public String getValidityPeriod() {
		return validityPeriod;
	}
	
	public String getCost() {
		return Cost;
	}
	public void setCost(String cost) {
		Cost = cost;
	}
	public String getVoucherAvailabilty() {
		return voucherAvailabilty;
	}
	public void setVoucherAvailabilty(String voucherAvailabilty) {
		this.voucherAvailabilty = voucherAvailabilty;
	}
	public void setValidityPeriod(String validityPeriod) {
		this.validityPeriod = validityPeriod;
	}
	public String getDescription1() {
		return description1;
	}
	public void setDescription1(String description1) {
		this.description1 = description1;
	}
	public String getDescription2() {
		return description2;
	}
	public void setDescription2(String description2) {
		this.description2 = description2;
	}
	public String getDescription3() {
		return description3;
	}
	public void setDescription3(String description3) {
		this.description3 = description3;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getSubcribeCost() {
		return subcribeCost;
	}
	public void setSubcribeCost(String subcribeCost) {
		this.subcribeCost = subcribeCost;
	}
}
