package com.example.demo.repository;

import com.example.demo.entity.certifications;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CertificationRepository extends JpaRepository<certifications, Long> {

	certifications findByCertificationName(String certificationName);

    List<certifications> findByCertificationNameContainingIgnoreCaseOrOrganizationNameContainingIgnoreCase(String query,
            String query2);
    
}
