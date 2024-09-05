package com.example.demo.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class AdminCertifications {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String email;
    private String organizationName;
    private String certificationName;
    private String certificationCode;
    private double marksScored;
    private double totalmarks;
    private int yearOfCertified;
    @Column(length = 1000)
    private String certificateId;
    

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public double getTotalmarks() {
		return totalmarks;
	}

	public void setTotalmarks(double totalmarks) {
		this.totalmarks = totalmarks;
	}

	public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public double getMarksScored() {
        return marksScored;
    }

    public void setMarksScored(double marksScored) {
        this.marksScored = marksScored;
    }

    public int getYearOfCertified() {
        return yearOfCertified;
    }

    public void setYearOfCertified(int yearOfCertified) {
        this.yearOfCertified = yearOfCertified;
    }

    public String getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(String certificateId) {
        this.certificateId = certificateId;
    }
}
